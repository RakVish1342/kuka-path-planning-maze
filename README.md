### Kuka RRT Path Planner

This project uses the RRT path planning algorithm to move a kuka 6-DoF robotic arm around a maze. The green cube represents the start location and the red node represents the goal location. The arm initially picks up the block at the start location, moves it along the maze till the goal location using the RRT and then returns the block to the start position. The MoveIt package has been made use of.

<img src="./gifs/kukaEnv.gif" height="300" width="400" /> 


#### Usage:

**Instructions to Build:**

```
catkin_init_workspace
catkin build
source devel/setup.bash
```

**Instructions to Run (should be launched in order):**

```
roslaunch rll_planning_project moveit_planning_execution.launch
roslaunch rll_planning_project planning_iface.launch
roslaunch rll_planning_project path_planner.launch
roslaunch rll_tools run_project.launch
```

**Viewing RRT graph on the table:**

A ```MarkerArray``` containing nodes from the RRT are published to the ```/rrt/samples``` topic. 
So to view the RRT on the table top, once all four roslaunch commands have been run, add ```MarkerArray``` to RViz and select the ```/rrt/samples``` topic to view markers.


<img src="./gifs/kuka_rrt.gif" height="300" width="400" />


**Configuration File:**

The ```launch/planning_iface.launch``` file has the start location, goal location and table dimension parameters. Start and goal locations can be modified in this file as needed to simulate different scenarios.


#### Algorithm and Challenges:

RRTs are good in exploring large open spaces, but can become slow when working in narrow passages or small openings. All the passages in the maze are narrow, with a width just sufficient to fit the block and grasper. Passages become marginally larger at intersections and just wide enough to allow rotations. 

Compared to RRTs, traditional graph search techniques like BFS and A* would find solutions faster such an environment, since it is a highly structured and stationary. However the goal I set out with, was to use RRT for the given environment since RRTs do not require any prior knowledge about the environment and also do not require descretizing the entire search space. Using RRTs in such a constricted environemnt would help me better understand in what kind of cases RRT fails, and thus force me to explore variants of RRT that would better suit such a narrow passage environment. 

For this environment using the vanilla RRT did not work well. Many of the exploration nodes would lead to collisions against walls because the arm had very little room to move within the passage. To counter this ```incremental domain expansion``` was used. Here, the search domain was first restricted to a small area around the gripper rather than sampling from the whole maze/table. Once a certain number of samples were collected, the exploration domain was expanded to slightly larger concentric circle. This helped focus the exploration within the area around the gripper without leading to as many collisions. Then exploring a concentric circle around the prevous circle allowed for good outward connections to be made from the inner set of samples.


**Algorithm:**
```

GetSample(rad_min, rad_max):
    r = rand(rad_min, rad_max) // Some concentric circle in current concentric search space
    peri = rand(0, 2*pi*r) // Where along that cirlce's perimeter the sample should lie
    angle = peri/(2*pi*r)
    x = closest_node_x + r*cos(angle)
    y = closest_node_y + r*sin(angle)
    return (x, y)


Initialize tree_root node
Initialize local search domain radius

while(goal_not_reached):

    min_radius, max_radius = Increase local search domain
    inner_loop_tot = increase number of sample points //since search domain gets larger slowly


    For inner_loop_tot number of times

        sample_node = GetSample() from sample space

        If(collision):
            Use midpoint formula till 
	        distance from closest_node to sample_node <= dist_thresh OR no collision from closest_node

            If(collision):
    	        continue
            Else:
	        Add connection to node from closest node

        Else:
            Add connection to node from closest node


    Update tree_root = node in tree closest to goal


````

#### Further Improvements:

* Adding goal exploration bias of 5%-10%
* Use of RRT-CONNECT would help reach goal faster in cases where a straight line path exists
* Implementing RRT* so that tree's path gets cleaned up
* Fix getting stuck at 'local minima' with additional search domain size

#### Points to Note:

* Current algorithm performs incremental domain search only twice in the inner loop. The final domain size is comaprable to the size of the maximum gap/width in the maze. If the start node and goal node have either the same X or Y coordinate, but are not directly accessible (ie. obstacle exists between them) the RRT will get stuck at a local 'minima'. The RRT will keep picking the root node as the closest node and get stuck. To fix this, a setup to detect the selection of the same node as the root node should be implemented. If this same node is selected multiple times, then the incremental search domain should be increased by larger values OR more number of times before updating the tree root to the closest_node.

* The RRT was stored as a kd-tree so that searching for ```closest_node``` within the tree is fast. Note however, actual path that RRT path is not the same as the path from the root to the child node! The Kd-tree simply stores points in a spatially separated manner for fast query. However the actual order in which the nodes get connected while RRT exploration occurs can be different (especially at corners where kd-tree stores nodes in line of sight (as that is closer in a 'spatial' sense), while actual RRT path would be to go around the corner). So, the actual RRT path was stored using a ```parent_node``` pointer.

#### References and Further Details:

* Original repository was taken from the Robotics Learning Lab of KIT: https://github.com/KITrobotics/rll_path_planning_project

* Papers related to: RRT, RRT*, RRT-Connect, etc

* ADD OTHERS

TODO: Save rviz config with markerarray and /rrt/samples topic already added.
