#! /usr/bin/env python

import rospy
import actionlib
from rll_planning_project.srv import *
from rll_planning_project.msg import *
from geometry_msgs.msg import Pose2D
from heapq import heappush, heappop # for priority queue
import math
import random
import numpy as np
import userUtils

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

    numSamples = 500
    distSearch = 0.2 #
    distCorrection = 0.3 # Later for RRT*
    bReachedGoal = False

     # Initialize kdtree with root at start location 
    rrt = userUtils.KDTree(value=(xStart, yStart))

    '''
    Uses midPoint formula to find a new sample point along sample and closest that is 
    within the given threshold
    '''
    def findPointAlongLine(closest, sample, distThresh):
        dist = userUtils.distance(closest, sample)
        while(dist > distThresh):
            # midPoint acts like new sample
            sample = ( (closest[0]+sample[0])/2, (closest[1]+sample[1])/2 )
            dist = userUtils.distance(closest, sample)
        return sample

    ctr = 0
    while(ctr <= numSamples or ~bReachedGoal):

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

        closest, distFlag = rrt.search(sample, distSearch)

        print("@@@@@@@@@@@@@@@")
        print(closest, sample)

        # If sample is not within distSearch away from closest point in rrt, 
        # Find a point along the line from closest point to sample point, which 
        # is at a given dist away from closest point
        if(~distFlag):
            sample = findPointAlongLine(closest, sample, distSearch)

        print("@@@@@@@@@@@@@@@")
        print(closest, sample)

        break



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
