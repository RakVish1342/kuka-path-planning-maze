import pdb

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
                        depth += 1

                if(value[0] > node.val[0]):
                    if(node.childRight is None):
                        node.childRight = Node()
                        node.childRight.val = value
                        node.childRight.depth = depth+1
                        break
                    else:
                        node = node.childRight
                        depth += 1

            else: # Compare y coordinates
                if(value[1] <= node.val[1]):
                    if(node.childLeft is None):
                        node.childLeft = Node()
                        node.childLeft.val = value
                        node.childLeft.depth = depth+1
                        break
                    else:
                        node = node.childLeft
                        depth += 1

                if(value[1] > node.val[1]):
                    if(node.childRight is None):
                        node.childRight = Node()
                        node.childRight.val = value
                        node.childRight.depth = depth+1
                        break
                    else:
                        node = node.childRight
                        depth += 1


    def search(self):
        print("dummy")
        # do 

