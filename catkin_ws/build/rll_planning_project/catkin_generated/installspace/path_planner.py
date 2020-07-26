#!/usr/bin/env python2

import rospy
import actionlib
from rll_planning_project.srv import *

#from rll_planning_project.msg import *
from rll_move_client.client import RLLDefaultMoveClient

from geometry_msgs.msg import Pose2D
from geometry_msgs.msg import Point
from heapq import heappush, heappop # for priority queue
import math

from visualization_msgs.msg import Marker
from visualization_msgs.msg import MarkerArray
from geometry_msgs.msg import Pose
import random
import numpy as np
import userUtils
import tf
import time

import pdb
import copy

def plan_to_goal(_arg):
    """ Plan a path from Start to Goal """
    pose_start = Pose2D()
    pose_goal = Pose2D()
    pose_check_start = Pose2D()
    pose_check_goal = Pose2D()
    pose_move = Pose2D()

    rospy.loginfo("Got a planning request")

    get_start_goal_srv = rospy.ServiceProxy('get_start_goal', GetStartGoal)
    start_goal = get_start_goal_srv()

    pose_start = start_goal.start
    pose_goal = start_goal.goal


    move_srv = rospy.ServiceProxy('move', Move)
    check_srv = rospy.ServiceProxy('check_path', CheckPath, persistent=True)

    # Input: map dimensions, start pose, and goal pose
    # retrieving input values
    maze_x_dim = rospy.get_param('/iiwa/planning_iface/maze_x_dim')
    maze_y_dim = rospy.get_param('/iiwa/planning_iface/maze_y_dim')
    xStart, yStart, tStart = pose_start.x, pose_start.y, pose_start.theta
    xGoal, yGoal, tGoal = pose_goal.x, pose_goal.y, pose_goal.theta

    # printing input values
    rospy.loginfo("map dimensions: width=%1.2fm, length=%1.2fm", maze_x_dim, maze_y_dim)
    print("map dimensions: width=%1.2fm, length=%1.2fm", maze_x_dim, maze_y_dim)
    rospy.loginfo("start pose: x %f, y %f, theta %f", xStart, yStart, tStart)
    print("start pose: x %f, y %f, theta %f", xStart, yStart, tStart)
    rospy.loginfo("goal pose: x %f, y %f, theta %f", xGoal, yGoal, tGoal)
    print("goal pose: x %f, y %f, theta %f", xGoal, yGoal, tGoal)


    #################
    # RRT Algorithm #
    #################
    '''
    Uses midPoint formula to find a new sample point along sample and closest that is 
    within the given threshold.
    '''
    def getSample(xDom, yDom, xMax, yMax):

        if(xDom > xMax):
            xDom = xMax
        if(yDom > yMax):
            yDom = yMax

        sign = random.randint(0,1)
        if(sign):
            sign = 1
        else:
            sign = -1
        x = sign * random.uniform(0,xDom)
        sign = random.randint(0,1)
        if(sign):
            sign = 1
        else:
            sign = -1        
        y = sign * random.uniform(0,yDom)
        return (x, y)

    '''
    Circular Domain Increments
    Concentrically increase domain, while sampling only in the added increment. 
    If too many failed points are generated (ie. too many points are generated outside the domain)
    then stop expanding the domain and sample from the entire domain rather than just the increment portion
    '''
    def pointFromPeri(radiusInner, radiusOuter, center, limits, maxTriesLimit, maxTriesFlag):

        triesCtr = 0
        validPt = False
        # maxTriesFlag = False # Don't reset this flag. Once domain limit is reached, just use full domain
        while(not validPt):

            rad = random.uniform(radiusInner, radiusOuter)
            # print("rad: ", str(rad) + ", " + str(radiusInner) + ", " + str(radiusOuter))
            peri = 2*math.pi*rad
            # print("peri: ", peri)
            prm = random.uniform(0, peri)
            # print("prm: ", prm)

            # Circle defined as per anti-clockwise angle from the x axis
            angle = 2*math.pi* (prm/peri)
            x = rad*math.cos(angle)
            y = rad*math.sin(angle)

            # print("limits: ", limits)
            if(x>=limits[0] and x<=limits[1] and y>=limits[2] and y<=limits[3]):
                validPt = True
            else:
                triesCtr += 1
                # print("Invalid Pt: ", (x,y))

            # continuously sampling outside the allowed sampling area means stop increasing sample domain
            if(triesCtr > maxTriesLimit):
                maxTriesFlag = True
                break
        
        pt = (x,y)
        # print("pt: ", pt)
        x = x + center[0]
        y = y + center[1]
        pt = (x,y)
        # print("pt: ", pt)
        return pt, maxTriesFlag, rad

    def findPointAlongLine(closest, sample, distThresh):
        dist = userUtils.distance(closest, sample)
        while(dist > distThresh):
            # midPoint acts like new sample
            sample = ( (closest[0]+sample[0])/2, (closest[1]+sample[1])/2 )
            dist = userUtils.distance(closest, sample)
        return sample
    
    def checkOrientations(startNode, goalLoc):
        ## Do something about orientation having to be maintained similar to previous orientations...OR I think since
        # poses are required, this will be done automatically. OR can be added as a componenet that calculates the distance
        # BUT since I'm considering all orientations rather than just closest, won't need to do any of this.
        orients = (0, math.pi/2, math.pi, -math.pi/2)
        # orients = (0, math.pi/4, math.pi/2, 3*math.pi/4, math.pi, -math.pi/4, -math.pi/2, -3*math.pi/4)
        
        startConfig = Pose2D()
        startConfig.x = startNode.val[0]
        startConfig.y = startNode.val[1]
        startConfig.theta = startNode.theta
        goalConfig = Pose2D()
        goalConfig.x = goalLoc[0]
        goalConfig.y = goalLoc[1]
        
        # allowedOrients = np.array([])
        allowedOrients = []
        chkFlag = False
        retTh = None
        for th in orients:
            goalConfig.theta = th
            tmpFlag = check_srv(startConfig, goalConfig)
            if(tmpFlag.valid):
                chkFlag = True
                # allowedOrients = np.append(allowedOrients, th)
                allowedOrients.append(th)

        return (chkFlag, allowedOrients)
    
    def createRRTNode(value, theta=None):
        node = userUtils.Node()
        node.val = value
        node.theta = theta
        return node

    def createMarkerPoint(node, ctr, color=(1.0, 0, 0), opaque=1.0, ns="rrt_sample_points", scale=0.02, lifetime=0, action='add'):
        markerPt = Marker()
        markerPt.header.stamp = rospy.Time.now()
        markerPt.header.frame_id = "maze" # frame wrt which this marker is defined        
        markerPt.ns = ns
        markerPt.id = ctr

        markerPt.type = Marker.SPHERE # Or value 2
        if(action == 'add'):
            markerPt.action = Marker.ADD # Or value 0 Or .UPDATE
        elif(action == 'delall'):
            markerPt.action = Marker.DELETEALL

        ps = Pose()
        ps.position.x = node.val[0]
        ps.position.y = node.val[1]
        markerPt.pose = ps
        markerPt.lifetime = rospy.Duration(lifetime) 
        
        markerPt.color.r = color[0]
        markerPt.color.g = color[1]
        markerPt.color.b = color[2]
        markerPt.color.a = opaque

        markerPt.scale.x = scale
        markerPt.scale.y = scale
        markerPt.scale.z = scale
        
        return markerPt

    def createMarkerLine(nodeSrc, nodeDst, ctr, action='add'):
        markerPt = Marker()
        markerPt.header.stamp = rospy.Time.now()
        markerPt.header.frame_id = "maze"
        markerPt.ns = "rrt_sample_connectors"
        markerPt.id = ctr # frame wrt which this marker is defined

        markerPt.type = Marker.ARROW # Or value 0
        if(action == 'add'):
            markerPt.action = Marker.ADD # Or value 0 Or .UPDATE
        elif(action == 'delall'):
            markerPt.action = Marker.DELETEALL

        src = Point()
        src.x = nodeSrc.val[0]
        src.y = nodeSrc.val[1]
        markerPt.points.append(src)
        dst = Point()
        dst.x = nodeDst.val[0]
        dst.y = nodeDst.val[1]
        markerPt.points.append(dst)

        markerPt.scale.x = 0.01
        markerPt.scale.y = 0.02

        markerPt.lifetime = rospy.Duration(0) 
        
        markerPt.color.r = 1.0
        markerPt.color.g = 1.0
        markerPt.color.a = 1.0

        return markerPt

    # To visualize the RRT
    # Using latched publishers so that RRT data persists after final publish event
    markerPub = rospy.Publisher('/rrt/samples', MarkerArray, queue_size=10, latch=True)
    marks = MarkerArray()

    rrtX = xStart
    rrtY = yStart
    rrtTh = tStart
    goal = (xGoal, yGoal)
    goalFound = False

    # manualFlag = False
    mainCtr = 0
    mainCtrMax = 30
    while(mainCtr <= mainCtrMax or (not goalFound) ):

        # Incremental Domain Expansion
        center = (rrtX, rrtY)
        limits = (-maze_x_dim/2.0, +maze_x_dim/2.0, -maze_y_dim/2.0, +maze_y_dim/2.0) # xmin, xmax, ymin, ymax

        ctr = 0
        failCtr = 0
        radiusOuter = 0
        radiusInner = radiusOuter
        radiusInc = 0.05
        perimeterInner = 0
        perimeterOuter = 0
        # Flag to check if domain should stop expanding due to constant out of bounds error.
        # ie. Domain is pretty much the size of global domain
        maxTriesFlag = False
        maxTriesLimit = 200
        totSamples = 200
        radiusIncBatch = 100

        distUnit = 0.01
        distSearch = 5*distUnit # is the min resolution allowed by rll SDK
        distExtend = 2*distSearch
        distCorrection = 0.3 # Later for RRT*

        # Initialize kdtree with root at start location 
        rrt = userUtils.KDTree(value=center, theta=rrtTh, doubleTree=True)
        if(not rrt.doubleTree):
            mark = createMarkerPoint(rrt.root, ctr, color=(0, 1.0, 0))
        else:
            mark = createMarkerPoint(rrt.xroot, ctr, color=(0, 1.0, 0))
        marks.markers.append(mark)

        # while(not manualFlag):
        # while(ctr < totSamples or (not bReachedGoal) ):
        while(ctr < totSamples):    
            print("===>"+str(ctr))

            # Sample a point
            if( (not maxTriesFlag) and ctr % radiusIncBatch == 0):
                print(">>> Domain Expanded")
                radiusInner = radiusOuter # Comment out to use full domain so far
                radiusOuter += radiusInc
                # radiusIncBatch = radiusIncBatch + ( radiusIncBatch + int(0.02*radiusIncBatch) )

                # Visualize search domain
                rrtNode = createRRTNode( (rrtX, rrtY) )
                markerPt = createMarkerPoint(rrtNode, 999999, color=(1.0, 1.0, 1.0), opaque=0.2, ns="rrt_search_domain", scale=2*radiusOuter)
                marks.markers.append(markerPt)
                markerPt = createMarkerPoint(rrtNode, 999998, color=(1.0, 1.0, 1.0), opaque=0.4, ns="rrt_search_domain", scale=2*radiusInner)
                marks.markers.append(markerPt)
               
            ctr += 1

            if(not goalFound):
                sample, maxTriesFlag, _ = pointFromPeri(radiusInner, radiusOuter, center, limits, maxTriesLimit, maxTriesFlag)
            else:
                sample = goal
            # sampleNode = createRRTNode(sample)
            sampleNode = createRRTNode(sample, theta=rrtTh) # by default take start node's theta


            if (maxTriesFlag): # Failed to generate points. Reached limit. Start generating points over full domain now
                # print(">>> Reached the domain limit. Using entire domain now.")
                radiusInner = 0

            closestNode, distFlag, _, _ = rrt.search(sampleNode, distSearch)

            # If sample is not within distSearch away from closest point in rrt, 
            # Find a point along the line from closest point to sample point, which 
            # is at a given dist away from closest point
            if(~distFlag):
                sample = findPointAlongLine(closestNode.val, sampleNode.val, distSearch) # or use distExtend here?
                sampleNode = createRRTNode(sample)

            ## Add a reachability check before inserting into rrt
            ## Add orientation check
            chkFlag, allowedOrients = checkOrientations(closestNode, sampleNode.val)
            
            if(chkFlag):
                for allowedTh in allowedOrients:
                    sampleNode.theta = allowedTh
                    sampleNode.parentInPath = closestNode
                    rrt.insert(sampleNode)
                    markPt = createMarkerPoint(sampleNode, ctr)
                    markLine = createMarkerLine(closestNode, sampleNode, ctr)
                    marks.markers.append(markPt)
                    marks.markers.append(markLine)
                    ctr += 1 # To generate unique ID for multiple points if generated
                    
                    # Check if this node can reach goal node
                    goalFound = False
                    # Artificially restrict the direct goal check distance to that allowed by tree
                    if(userUtils.distance(sampleNode.val, goal) <= distExtend):
                    # if(userUtils.distance(sampleNode.val, goal, sampleNode.theta, tGoal, unitDist=distUnit) <= distExtend):
                        ### goalTest()
                        chkFlag, allowedTh = checkOrientations(sampleNode, goal)
                        if(chkFlag):
                            goalNode = createRRTNode(goal)
                            goalNode.theta = allowedTh
                            goalNode.parentInPath = sampleNode
                            # rrt.insert(sampleNode)
                            rrt.insert(goalNode)
                            goalFound = True
                            break
                        ### goalTest() end

            else:
                # print(">>> Unable to use point. CHKFLG False: ", str(sample) + ", ", str(sampleNode.theta))
                markPt = createMarkerPoint(sampleNode, failCtr, color=(0, 0, 1.0), ns="rrt_CHK_fail_sample", lifetime=10)
                marks.markers.append(markPt)
                failCtr += 1

            #time.sleep(2)
            markerPub.publish(marks)

        # markerPub.publish(marks)

        if(not goalFound):
            print("GOAL NOT FOUND YET")
        else:
            print("FOUND THE GOAL")

        markPt = createMarkerPoint(sampleNode, failCtr, color=(0, 0, 1.0), lifetime=10, action='delall')
        markLine = createMarkerLine(closestNode, sampleNode, ctr, action='delall')
        markPt = createMarkerPoint(sampleNode, failCtr, color=(0, 0, 1.0), ns="rrt_CHK_fail_sample", lifetime=10, action='delall')

        goalNode = createRRTNode(goal)
        startNode, distFlag, pathKD, _ = rrt.search(goalNode, 0.001, getPathKD=True)
        rrtX = startNode.val[0]
        rrtY = startNode.val[1]
        rrtTh = startNode.theta

        ### Move incrementally
        # Extract path to go to the new start node from it.
        path = []
        path.append(startNode)
        parent = startNode.parentInPath
        while(not (parent==None)):
            path.append(parent)
            parent = parent.parentInPath
        # Move to the new startNode location
        print(">>> Moving arm to new location.")
        for ctr in range(len(path)-1, 0, -1): # Backward loop
            # print(p.val)
            p = path[ctr]
            pose = Pose2D()
            pose.x = p.val[0]
            pose.y = p.val[1]
            pose.theta = p.theta
            resp = move_srv(pose)
            if(not resp.success):
                print(">>> Error moving to a particular node. Nodes may be too close. Going to next node in sequence. : ", p.val)
        ###

        if(path is not None):
            if(pathKD[0].val == goal): # path stores path in opposite direction, so if first element in goal
                print("MOVED TO GOAL. EXITING.")
                break
        
        mainCtr += 1

    print("===")
    print("RRT Done.")
        
    ####################
    # End of Algorithm #
    ####################


class PathPlanner:
    def __init__(self):
        self.server = actionlib.SimpleActionServer("plan_to_goal", PlanToGoalAction, self.execute, False)
        self.server.start()

    def execute(self, req):
        plan_to_goal(req)
        self.server.set_succeeded()


if __name__ == '__main__':
    rospy.init_node('path_planner')
    client = RLLDefaultMoveClient(plan_to_goal)
    client.spin()

    #server = PathPlanner()

    #rospy.spin()
