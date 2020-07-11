#! /usr/bin/env python

import rospy
import os
import actionlib
from rll_planning_project.srv import *
from rll_planning_project.msg import *
from geometry_msgs.msg import Pose2D
from heapq import heappush, heappop # for priority queue
import math

from visualization_msgs.msg import Marker
from visualization_msgs.msg import MarkerArray
from geometry_msgs.msg import Pose
from geometry_msgs.msg import Point
import random
import numpy as np
import tf
import userUtils

class Visualize:
    
    def __init__(self):
        self.markerPub = rospy.Publisher('/rrt/sample', Marker, queue_size=10, latch=True)
        self.markerArrayPub = rospy.Publisher('/rrt/samplesArray', MarkerArray, queue_size=10, latch=True)
        self.markerPt = Marker()
        self.markerArray = MarkerArray()


    def sendSpherical(self):
        self.markerPt.ns = "rrt_sample"
        self.markerPt.id = 1 # frame wrt which this marker is defined
        self.markerPt.header.stamp = rospy.Time.now()
        
        self.markerPt.header.frame_id = "map"
        self.markerPt.type = 2 #Marker.SPHERE # Or value 2
        self.markerPt.action = 0 #Marker.ADD # Or value 0 Or .UPDATE
        
        ps = Pose()
        ps.position.x = 0.0
        ps.position.y = 0.0
        # ps.position.z = 0.0
        self.markerPt.pose = ps

        # self.markerPt.pose.orientation.x = 0
        # self.markerPt.pose.orientation.y = 0
        # self.markerPt.pose.orientation.z = 0
        # self.markerPt.pose.orientation.w = 1.0     
        
        # needs to be in ros time not int value # https://answers.ros.org/question/231781/rviz-markers-with-rospy/
        # Maybe okay to exclude here since we are using a latched topic
        self.markerPt.lifetime = rospy.Duration(0) 
        
        self.markerPt.color.r = 1.0
        # self.markerPt.color.g = 0.0
        # self.markerPt.color.b = 0.0
        self.markerPt.color.a = 1.0

        self.markerPt.scale.x = 1.0
        self.markerPt.scale.y = 1.0
        self.markerPt.scale.z = 1.0
        
        self.markerPub.publish(self.markerPt)
        
        print("done spherical")


    def sendArrow(self):
        self.markerPt.ns = "rrt_sample"
        self.markerPt.id = 1 # frame wrt which this marker is defined
        self.markerPt.header.stamp = rospy.Time.now()
        
        self.markerPt.header.frame_id = "map"
        self.markerPt.type = Marker.ARROW #Marker.SPHERE # Or value 2
        self.markerPt.action = 0 #Marker.ADD # Or value 0 Or .UPDATE
        
        ps = Pose()
        ps.position.x = 0.0
        ps.position.y = 0.0
        # ps.position.z = 0.0
        self.markerPt.pose = ps

        # self.markerPt.pose.orientation.x = 0
        # self.markerPt.pose.orientation.y = 0
        # self.markerPt.pose.orientation.z = 3.14159/4
        # self.markerPt.pose.orientation.w = 1.0
        quaternion = tf.transformations.quaternion_from_euler(0, 0, 3.14159/4)
        #type(pose) = geometry_msgs.msg.Pose
        self.markerPt.pose.orientation.x = quaternion[0]
        self.markerPt.pose.orientation.y = quaternion[1]
        self.markerPt.pose.orientation.z = quaternion[2]
        self.markerPt.pose.orientation.w = quaternion[3]
        
        # needs to be in ros time not int value # https://answers.ros.org/question/231781/rviz-markers-with-rospy/
        # Maybe okay to exclude here since we are using a latched topic
        self.markerPt.lifetime = rospy.Duration(0) 
        
        self.markerPt.color.r = 1.0
        self.markerPt.color.g = 1.0
        # self.markerPt.color.b = 0.0
        self.markerPt.color.a = 1.0

        self.markerPt.scale.x = 0.5
        self.markerPt.scale.y = 0.1
        self.markerPt.scale.z = 0.1
        
        self.markerPub.publish(self.markerPt)
        
        print("done arrow")


    def sendArrow2(self):
        markerPt = Marker()
        markerPt.header.stamp = rospy.Time.now()
        markerPt.header.frame_id = "map"
        markerPt.ns = "rrt_sample"
        markerPt.id = 99 # frame wrt which this marker is defined

        markerPt.type = Marker.ARROW #Marker.SPHERE # Or value 2
        markerPt.action = Marker.ADD # Or value 0 Or .UPDATE

        src = Point()
        src.x = 0
        src.y = 0
        markerPt.points.append(src)
        dst = Point()
        dst.x = 1
        dst.y = 1
        markerPt.points.append(dst)

        markerPt.scale.x = 0.5
        markerPt.scale.y = 1.0

        markerPt.lifetime = rospy.Duration(0) 
        
        markerPt.color.r = 1.0
        markerPt.color.g = 1.0
        markerPt.color.a = 1.0    

        self.markerPub.publish(markerPt)    

        print("done arrow2")


    def sendArrowArray(self):

        for i in range(2):
            print(i)
            markerPt = Marker()
            markerPt.ns = "rrt_sample"
            markerPt.id = i # frame wrt which this marker is defined
            markerPt.header.stamp = rospy.Time.now()
            
            markerPt.header.frame_id = "map"
            markerPt.type = Marker.ARROW #Marker.SPHERE # Or value 2
            markerPt.action = 0 #Marker.ADD # Or value 0 Or .UPDATE
            
            ps = Pose()
            ps.position.x = 0.0 + i
            ps.position.y = 0.0
            # ps.position.z = 0.0
            markerPt.pose = ps

            # self.markerPt.pose.orientation.x = 0
            # self.markerPt.pose.orientation.y = 0
            # self.markerPt.pose.orientation.z = 3.14159/4
            # self.markerPt.pose.orientation.w = 1.0
            quaternion = tf.transformations.quaternion_from_euler(0, 0, 3.14159/4)
            #type(pose) = geometry_msgs.msg.Pose
            markerPt.pose.orientation.x = quaternion[0]
            markerPt.pose.orientation.y = quaternion[1]
            markerPt.pose.orientation.z = quaternion[2]
            markerPt.pose.orientation.w = quaternion[3]
            
            # needs to be in ros time not int value # https://answers.ros.org/question/231781/rviz-markers-with-rospy/
            # Maybe okay to exclude here since we are using a latched topic
            markerPt.lifetime = rospy.Duration(0) 
            
            markerPt.color.r = 1.0
            markerPt.color.g = 1.0
            markerPt.color.b = 1.0
            markerPt.color.a = 1.0

            markerPt.scale.x = 0.5
            markerPt.scale.y = 0.1
            markerPt.scale.z = 0.1

            self.markerArray.markers.append(markerPt)
            

        self.markerArrayPub.publish(self.markerArray)
        
        print("done arrow array")



if __name__ == '__main__':

    
    ## Manually run the following two commands in another terminal
    ## roscore
    # cmd = 'roscore &'
    # os.system(cmd)
    ## creating a static tf to the center of the grid of rviz
    # cmd = 'rosrun tf static_transform_publisher 0 0 0 0 0 0 1 map my_frame 10 &'
    # os.system(cmd)
    
    
    rospy.init_node('marker_visualize')

    viz = Visualize()
    # viz.sendSpherical()
    # viz.sendArrow()
    viz.sendArrow2()
    # viz.sendArrowArray()

    ## Check which exact topic markers are being published.

    rospy.spin()
