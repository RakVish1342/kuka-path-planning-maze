import pdb
import numpy as np

def distance(pt1, pt2):
    dist = ( (pt1[0]-pt2[0])**2 + (pt1[1]-pt2[1])**2 )**0.5
    return dist

# Binary Node
class Node:

    def __init__(self):
        self.val = (None, None)
        self.depth = None
        self.childLeft = None
        self.childRight = None

class KDTree:

    # Python does not have constructor overloading. Just need to 
    #set the default value to the args that it accepts
    # def __init__(self):
    #     self.tree = Node() # Create root node
    def __init__(self, value=(None, None)):
        self.root = Node() # Create root node
        self.root.val = value
        self.root.depth = 0

    '''
    Insert a node into the kdtree
    '''
    def insert(self, value):
        # pdb.set_trace()
        print("Inserting a node: ", value)
        node = self.root
        depth = 0

        while(1):

            if(depth%2 == 0): # Compare x coordinates
                if(value[0] <= node.val[0]):
                    if(node.childLeft is None): # Create a new node here
                        node.childLeft = Node()
                        node.childLeft.val = value
                        node.childLeft.depth = depth+1
                        break # done inserting
                    else: # continue on with the search of empty node
                        node = node.childLeft

                if(value[0] > node.val[0]):
                    if(node.childRight is None):
                        node.childRight = Node()
                        node.childRight.val = value
                        node.childRight.depth = depth+1
                        break
                    else:
                        node = node.childRight

            else: # Compare y coordinates
                if(value[1] <= node.val[1]):
                    if(node.childLeft is None):
                        node.childLeft = Node()
                        node.childLeft.val = value
                        node.childLeft.depth = depth+1
                        break
                    else:
                        node = node.childLeft

                if(value[1] > node.val[1]):
                    if(node.childRight is None):
                        node.childRight = Node()
                        node.childRight.val = value
                        node.childRight.depth = depth+1
                        break
                    else:
                        node = node.childRight
            
            depth += 1

    '''
    Search for a point that is within distThresh. 

    If not found within given thresh, just return latest node explored, 
    as that would be closest point to given point.

    Same implementation as insert, except that in the end the latest searched node is returned
    and a flag is sent back. (if the node returned is within the given threshold or is just the closest point)
    '''
    def search(self, value, distThresh):

        node = self.root
        depth = 0
        points = []
        dists = []

        # pdb.set_trace()

        # Search till None node is reached. Once None is reached, return latest node value
        while(1):

            dist = distance(node.val, value)
            if(dist <= distThresh):
                # Don't just directly concider the first point to be the closest/valid point. 
                # Multiple may satisfy distance requirement. So add all that satisfy to a list
                # Pick best from list at the end.
                points.append(node.val)
                dists.append(dist)
                distFlag = True

            if(depth%2 == 0): # Compare x coordinates
                if(value[0] <= node.val[0]):
                    if(node.childLeft is None): # Just return the latest node
                        points.append(node.val)
                        distFlag = False
                        break
                    else: # continue on with the search of empty node
                        node = node.childLeft

                if(value[0] > node.val[0]):
                    if(node.childRight is None):
                        points.append(node.val)
                        distFlag = False
                        break
                    else:
                        node = node.childRight

            else: # Compare y coordinates
                if(value[1] <= node.val[1]):
                    if(node.childLeft is None):
                        points.append(node.val)
                        distFlag = False
                        break
                    else:
                        node = node.childLeft

                if(value[1] > node.val[1]):
                    if(node.childRight is None):
                        points.append(node.val)
                        distFlag = False
                        break
                    else:
                        node = node.childRight

            depth += 1
        
        ''' 
        Find closest point among short listed points
        '''
        def findClosest(points, dists):
            minLoc = np.argmin(dists)
            return points[minLoc]

        if(len(points) == 1):
            point = points[0]
        else:
            # If multiple entries exist, means atleast one optimal pt exist. So exclude the 
            # last added sub-optimal point due to reaching the None branch. This way points
            # and dists will be of equal length
            points = points[0:-1]
            point = findClosest(points, dists)

        return (point, distFlag)

            
        
