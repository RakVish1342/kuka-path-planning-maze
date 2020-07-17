#! /usr/bin/env python

from geometry_msgs.msg import Point
from geometry_msgs.msg import Pose
from geometry_msgs.msg import Pose2D
from visualization_msgs.msg import Marker
from visualization_msgs.msg import MarkerArray
import math
import numpy as np
import random
import rospy
import tf
import time

import userUtils

import pdb

class RRTVisualize:

    def __init__(self):
        self.dummy = 0

    def getSample(self, xMax, yMax):
        sign = random.randint(0,1)
        if(sign):
            sign = 1
        else:
            sign = -1
        x = sign * random.uniform(0,xMax)
        sign = random.randint(0,1)
        if(sign):
            sign = 1
        else:
            sign = -1        
        y = sign * random.uniform(0,yMax)
        return (x, y)

    '''
    Circular Domain Increments
    Concentrically increase domain, while sampling only in the added increment. 
    If too many failed points are generated (ie. too many points are generated outside the domain)
    then stop expanding the domain and sample from the entire domain rather than just the increment portion
    '''
    def pointFromPeri(self, radiusInner, radiusOuter, center, limits, maxTriesLimit, maxTriesFlag):

        triesCtr = 0
        validPt = False
        # maxTriesFlag = False # Don't reset this flag. Once domain limit is reached, just use full domain
        while(not validPt):

            rad = random.uniform(radiusInner, radiusOuter)
            print("rad: ", rad)
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
                print("Invalid Pt: ", (x,y))

            if(triesCtr > maxTriesLimit):
                maxTriesFlag = True
                break
        
        pt = (x,y)
        # print("pt: ", pt)
        x = x + center[0]
        y = y + center[1]
        pt = (x,y)
        # print("pt: ", pt)
        return pt, maxTriesFlag



    def findPointAlongLine(self, closest, sample, distThresh):
        dist = userUtils.distance(closest, sample)
        while(dist > distThresh):
            # midPoint acts like new sample
            sample = ( (closest[0]+sample[0])/2, (closest[1]+sample[1])/2 )
            dist = userUtils.distance(closest, sample)
        return sample
    
    def checkOrientations(self, startNode, goalLoc):
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
    
    def createRRTNode(self, value, theta=None):
        node = userUtils.Node()
        node.val = value
        node.theta = theta
        return node

    def createMarkerPoint(self, node, ctr):
        markerPt = Marker()
        markerPt.header.stamp = rospy.Time.now()
        markerPt.header.frame_id = "map" # frame wrt which this marker is defined        
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
        markerPt.scale.x = 0.1*scale
        markerPt.scale.y = 0.1*scale
        markerPt.scale.z = 0.1*scale
        
        return markerPt

    def createMarkerLine(self, nodeSrc, nodeDst, ctr):
        markerPt = Marker()
        markerPt.header.stamp = rospy.Time.now()
        markerPt.header.frame_id = "map"
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

        markerPt.scale.x = 0.1
        markerPt.scale.y = 0.2

        markerPt.lifetime = rospy.Duration(0) 
        
        markerPt.color.r = 1.0
        markerPt.color.g = 1.0
        markerPt.color.a = 1.0

        return markerPt    


    def execute(self):
        # To visualize the RRT
        # Using latched publishers so that RRT data persists after final publish event
        markerPub = rospy.Publisher('/rrt/samplesTest', MarkerArray, queue_size=10, latch=True)
        marks = MarkerArray()

        xStart = 0
        yStart = 0
        tStart = 0
        center = (xStart, yStart)
        map_width = 20 # 0.1
        map_height = 20 # 0.1
        limits = (-map_width/2.0, +map_width/2.0, -map_height/2.0, +map_height/2.0) # xmin, xmax, ymin, ymax

        # Circular incremental domain expansion variables
        radiusOuter = 0
        radiusInner = radiusOuter
        radiusInc = 3
        perimeterInner = 0
        perimeterOuter = 0
        # Flag to check if domain should stop expanding due to constant out of bounds error.
        # ie. Domain is pretty much the size of global domain
        maxTriesFlag = False
        maxTriesLimit = 200
        totSamples = 500
        radiusIncBatch = 200
        ctr = 0

        # RRT variables
        distSearch = 1
        distCorrection = 0.3 # Later for RRT*
        bReachedGoal = False

        # Initialize kdtree with root at start location 
        rrt = userUtils.KDTree(value=(xStart, yStart), theta=tStart)
        mark = self.createMarkerPoint(rrt.root, ctr)
        marks.markers.append(mark)


        while(ctr < totSamples):
            # ctr += 1
            print("===:"+str(ctr))

            # Sample a point
            if( (not maxTriesFlag) and ctr % radiusIncBatch == 0):
                print("=====")
                radiusInner = radiusOuter
                radiusOuter += radiusInc

            sample, maxTriesFlag = self.pointFromPeri(radiusInner, radiusOuter, center, limits, maxTriesLimit, maxTriesFlag)

            if(not maxTriesFlag): # Valid point
                print("POINT: ", sample)
            else: # Failed to generate points. Reached limit. Start generating points over full domain now
                print(">>> Reached the domain limit. Using entire domain now.")
                radiusInner = 0

            ctr += 1

            # sample = samples[ctr-1]
            sampleNode = self.createRRTNode(sample)

            closestNode, distFlag = rrt.search(sampleNode, distSearch)
            print("---")
            print(closestNode.val, sampleNode.val)

            # If sample is not within distSearch away from closest point in rrt, 
            # Find a point along the line from closest point to sample point, which 
            # is at a given dist away from closest point
            if(~distFlag):
                sample = self.findPointAlongLine(closestNode.val, sampleNode.val, distSearch)
                sampleNode = self.createRRTNode(sample)

            print("---")
            print(closestNode.val, sampleNode.val)

            ## Add a reachability check before inserting into rrt
            ## Add orientation check
            # chkFlag, allowedTh = self.checkOrientations(closestNode, sampleNode.val)
            # if(chkFlag.valid):
            if(1):
                allowedTh = 0
                sampleNode.theta = allowedTh
                rrt.insert(sampleNode)
                markPt = self.createMarkerPoint(sampleNode, ctr)
                markLine = self.createMarkerLine(closestNode, sampleNode, ctr)
                marks.markers.append(markPt)
                marks.markers.append(markLine)
            
            time.sleep(0.05)
            markerPub.publish(marks)
        # markerPub.publish(marks)

    def infi(self):
        rate = rospy.Rate(0.03) # 10hz
        while(not rospy.is_shutdown()):
            print("sleeping...")
            rate.sleep()


if __name__=="__main__":

    ## Manually run the following two commands in another terminal
    ## roscore
    # cmd = 'roscore &'
    # os.system(cmd)
    ## creating a static tf to the center of the grid of rviz
    # cmd = 'rosrun tf static_transform_publisher 0 0 0 0 0 0 1 map my_frame 10 &'
    # os.system(cmd)

    rospy.init_node('rrt_visualize')

    rrtViz = RRTVisualize()

    rrtViz.execute()

    rrtViz.infi()
