#! /usr/bin/env python

import rospy
import actionlib
from rll_planning_project.srv import *
from rll_planning_project.msg import *
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


def plan_to_goal(req):
    """ Plan a path from Start to Goal """
    pose_start = Pose2D()
    pose_goal = Pose2D()
    pose_check_start = Pose2D()
    pose_check_goal = Pose2D()
    pose_move = Pose2D()

    rospy.loginfo("Got a planning request")

    pose_start = req.start
    pose_goal = req.goal

    move_srv = rospy.ServiceProxy('move', Move)
    check_srv = rospy.ServiceProxy('check_path', CheckPath, persistent=True)

    # Input: map dimensions, start pose, and goal pose
    # retrieving input values  
    map_width = rospy.get_param('~map_width')
    map_length = rospy.get_param('~map_length')
    xStart, yStart, tStart = pose_start.x, pose_start.y, pose_start.theta
    xGoal, yGoal, tGoal = pose_goal.x, pose_goal.y, pose_goal.theta

    # printing input values
    rospy.loginfo("map dimensions: width=%1.2fm, length=%1.2fm", map_width, map_length)
    print("map dimensions: width=%1.2fm, length=%1.2fm", map_width, map_length)
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
    def findPointAlongLine(closest, sample, distThresh):
        dist = userUtils.distance(closest, sample)
        while(dist > distThresh):
            # midPoint acts like new sample
            sample = ( (closest[0]+sample[0])/2, (closest[1]+sample[1])/2 )
            dist = userUtils.distance(closest, sample)
        return sample
    
    def checkOrientations(startNode, goalLoc):
        ## Do something about orientation having to be maintained similar to previous orientations...OR I think since
        # poses are required, this will be done automatically
        PI = 3.14159
        orients = (0, PI/2, PI, -PI/2)
        
        startConfig = Pose2D()
        startConfig.x = startNode.val[0]
        startConfig.y = startNode.val[1]
        startConfig.theta = startNode.theta
        goalConfig = Pose2D()
        goalConfig.x = goalLoc[0]
        goalConfig.y = goalLoc[1]
        
        # allowedOrients = []
        for th in orients:
            goalConfig.theta = th
            chkFlag = check_srv(startConfig, goalConfig)
            if(chkFlag.valid):
            #     rrt.insert( (goalConfig.x, goalConfig.y), th )
                retTh = th
            else:
                retTh = None

        return (chkFlag, retTh)
    
    def createRRTNode(value, theta=None):
        node = userUtils.Node()
        node.val = value
        node.theta = theta
        return node

    def createMarkerPoint(node, ctr):
        markerPt = Marker()
        markerPt.header.stamp = rospy.Time.now()
        markerPt.header.frame_id = "Maze" # frame wrt which this marker is defined        
        markerPt.ns = "rrt_sample"
        markerPt.id = ctr

        markerPt.type = Marker.SPHERE # Or value 2
        markerPt.action = Marker.ADD # Or value 0 Or .UPDATE

        ps = Pose()
        ps.position.x = node.val[0]
        ps.position.y = node.val[1]
        markerPt.pose = ps
        markerPt.lifetime = rospy.Duration(0) 
        
        markerPt.color.r = 1.0
        markerPt.color.a = 1.0

        scale = 2
        markerPt.scale.x = 0.01*scale
        markerPt.scale.y = 0.01*scale
        markerPt.scale.z = 0.01*scale
        
        return markerPt

    def createMarkerLine(nodeSrc, nodeDst, ctr):
        markerPt = Marker()
        markerPt.header.stamp = rospy.Time.now()
        markerPt.header.frame_id = "Maze"
        markerPt.ns = "rrt_sample_connectors"
        markerPt.id = ctr # frame wrt which this marker is defined

        markerPt.type = Marker.ARROW # Or value 0
        markerPt.action = Marker.ADD # Or value 0 Or .UPDATE

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

    numSamples = 40
    distSearch = 0.1
    distCorrection = 0.3 # Later for RRT*
    bReachedGoal = False

     # Initialize kdtree with root at start location 
    rrt = userUtils.KDTree(value=(xStart, yStart), theta=tStart)

    ctr = 0
    mark = createMarkerPoint(rrt.root, ctr)
    marks.markers.append(mark)
    while(ctr < numSamples or bReachedGoal):
        ctr += 1
        print("CTR::::::::::: ", ctr)

        # Sample a point
        sign = random.randint(0,1)
        if(sign):
            sign = 1
        else:
            sign = -1
        x = sign * random.uniform(0,map_width/2)
        sign = random.randint(0,1)
        if(sign):
            sign = 1
        else:
            sign = -1        
        y = sign * random.uniform(0,map_length/2)
        sample = (x, y)
        sampleNode = createRRTNode(sample)

        closestNode, distFlag = rrt.search(sampleNode, distSearch)
        print("=====")
        print(closestNode.val, sampleNode.val)

        # If sample is not within distSearch away from closest point in rrt, 
        # Find a point along the line from closest point to sample point, which 
        # is at a given dist away from closest point
        if(~distFlag):
            sample = findPointAlongLine(closestNode.val, sampleNode.val, distSearch)
            sampleNode = createRRTNode(sample)

        print("---")
        print(closestNode.val, sampleNode.val)

        ## Add a reachability check before inserting into rrt
        ## Add orientation check
        chkFlag, allowedTh = checkOrientations(closestNode, sampleNode.val)
        if(chkFlag.valid):
        # if(1):
            sampleNode.theta = allowedTh
            markPt = createMarkerPoint(sampleNode, ctr)
            markLine = createMarkerLine(closestNode, sampleNode, ctr)
            marks.markers.append(markPt)
            marks.markers.append(markLine)

        markerPub.publish(marks)

    # Output: movement commands
    pose_check_start.x, pose_check_start.y, pose_check_start.theta= xStart, yStart, tStart
    pose_check_goal.x, pose_check_goal.y, pose_check_goal.theta= xGoal, yGoal, tGoal
    resp = check_srv(pose_check_start, pose_check_goal) # checking if the arm can move to the goal pose
    if resp.valid:
        rospy.loginfo("Valid pose")
        pose_move.x, pose_move.y, pose_move.theta = xGoal, yGoal, tGoal 
        # executing a move command towards the goal pose
        resp = move_srv(pose_move)
    else:
        rospy.loginfo("Invalid pose")
        
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

    server = PathPlanner()

    rospy.spin()
