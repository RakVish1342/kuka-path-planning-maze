import pdb
import numpy as np

def distance(pt1, pt2):
    dist = ( (pt1[0]-pt2[0])**2 + (pt1[1]-pt2[1])**2 )**0.5
    return dist

# Binary Node
class Node:

    def __init__(self, value=(None, None), theta=None, depth=None):
        self.val = value
        self.theta = theta
        self.depth = depth
        self.childLeft = None
        self.childRight = None

class KDTree:

    # Python does not have constructor overloading. Just need to 
    #set the default value to the args that it accepts
    # def __init__(self):
    #     self.tree = Node() # Create root node
    def __init__(self, value=(None, None), theta=None):
        # Create root node
        self.root = Node(value=value, theta=theta, depth=0)

    '''
    Insert a node into the kdtree
    '''
    def insert(self, nodeIns):
        # pdb.set_trace()
        # print("Inserting a node: ", nodeIns.val, ", ", nodeIns.theta)
        node = self.root
        depth = 0

        while(1):

            nodeIns.depth = depth+1

            if(depth%2 == 0): # Compare x coordinates
                if(nodeIns.val[0] <= node.val[0]):
                    if(node.childLeft is None): # Create a new node here
                        node.childLeft = nodeIns
                        break # done inserting
                    else: # continue on with the search of empty node
                        node = node.childLeft

                else:
                    if(node.childRight is None):
                        node.childRight = nodeIns
                        break
                    else:
                        node = node.childRight

            else: # Compare y coordinates
                if(nodeIns.val[1] <= node.val[1]):
                    if(node.childLeft is None):
                        node.childLeft = nodeIns
                        break
                    else:
                        node = node.childLeft

                else:
                    if(node.childRight is None):
                        node.childRight = nodeIns
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
    def search(self, nodeSearch, distThresh):

        ## Will there be duplicate value entries?? But with different theta values??
        ## Change distance metric to account for this if so
        node = self.root
        depth = 0
        nodes = []
        dists = []
        distFlag = False

        # pdb.set_trace()

        # Search till None node is reached. Once None is reached, return latest node value
        while(1):

            nodeSearch.depth = depth

            dist = distance(node.val, nodeSearch.val)
            if(dist <= distThresh):
                # Don't just directly concider the first point to be the closest/valid point. 
                # Multiple may satisfy distance requirement. So add all that satisfy to a list
                # Pick best from list at the end.
                nodes.append(node)
                dists.append(dist)
                distFlag = True

            if(depth%2 == 0): # Compare x coordinates
                if(nodeSearch.val[0] <= node.val[0]):
                    if(node.childLeft is None): # Just return the latest node
                        nodes.append(node)
                        break
                    else: # continue on with the search of empty node
                        node = node.childLeft

                else:
                    if(node.childRight is None):
                        nodes.append(node)
                        break
                    else:
                        node = node.childRight

            else: # Compare y coordinates
                if(nodeSearch.val[1] <= node.val[1]):
                    if(node.childLeft is None):
                        nodes.append(node)
                        break
                    else:
                        node = node.childLeft

                else:
                    if(node.childRight is None):
                        nodes.append(node)
                        break
                    else:
                        node = node.childRight

            depth += 1
        
        ''' 
        Find closest node among shortlisted nodes
        '''
        def findClosest(nodes, dists):
            minLoc = np.argmin(dists)
            return nodes[minLoc]

        if(len(nodes) == 1):
            node = nodes[0]
        else:
            # If multiple entries exist, means atleast one optimal pt exist. So exclude the 
            # last added sub-optimal point due to reaching the None branch. This way nodes
            # and dists will be of equal length
            nodes = nodes[0:-1]
            node = findClosest(nodes, dists)

        return (node, distFlag)

            
        
