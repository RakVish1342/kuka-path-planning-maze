import pdb
from userUtils import Node
from userUtils import KDTree

print("--- SINGLE axis kd tree test ---")
kdtree = KDTree(value=(1,1))
ndPrev = kdtree.root

print(">>> INSERT ---")
nd = Node(value=(0,0))
nd.parentInPath = ndPrev
kdtree.insert(nd)
ndPrev = nd

nd = Node(value=(2,2))
nd.parentInPath = ndPrev
kdtree.insert(nd)
ndPrev = nd

nd = Node(value=(3,-5))
nd.parentInPath = ndPrev
kdtree.insert(nd)
ndPrev = nd

nd = Node(value=(4,20))
nd.parentInPath = ndPrev
kdtree.insert(nd)
ndPrev = nd

print(">>> SEARCH ---")
nd = Node(value=(2,2))
nd, flag, _, _ = kdtree.search(nd, 2)
print(nd.val, " ", flag)

# print("> Proof that nodes returned from the search function are actually references to orig node.")
# print("> So changing an attrib in original node or returned node will changing corsp attrib in the other location also.")
# print("> retNd=", nd.val, nd.theta, nd.parentInPath)
# print("> origNd=", kdtree.root.childRight.val, kdtree.root.childRight.theta, kdtree.root.childRight.parentInPath)
# kdtree.root.childRight.parentInPath = 'yolo'
# print("> retNd=", nd.val, nd.theta, nd.parentInPath)
# print("> origNd=", kdtree.root.childRight.val, kdtree.root.childRight.theta, kdtree.root.childRight.parentInPath)

nd = Node(value=(2.1,2.1))
nd, flag, _, _ = kdtree.search(nd, 2)
print(nd.val, " ", flag)

nd = Node(value=(3.1,-5.1))
nd, flag, _, _ = kdtree.search(nd, 0.2)
print(nd.val, " ", flag)

nd = Node(value=(-13,-13))
nd, flag, _, _ = kdtree.search(nd, 999)
print(nd.val, " ", flag)

nd = Node(value=(-13,-13))
nd, flag, _, _ = kdtree.search(nd, 0.2)
print(nd.val, " ", flag)

print(">>> PATH KD ---")
nd = Node(value=(4,4))
nd = Node(value=(4,20))
closestNode, distFlag, path, _ = kdtree.search(nd, 0.001, getPathKD=True)
if(distFlag):
    print("Path Retrieved: ", path)
    for p in path:
        print(p.val)
else:
    print("Path not found.")
if(distFlag):
    print("Path Retrieved: ", path)
    for p in path:
        print(p.val)
else:
    print("Path not found.")

print(">>> REVERSE PATH ACC. MANUAL PARENT NODES ---")
path = []
# nd = Node(value=(4,4))
nd = Node(value=(4,20))
closestNode, distFlag, pathKD, _ = kdtree.search(nd, 0.001, getPathKD=True)
if(distFlag):
    print("Manual path found.")
    path.append(closestNode)
    parent = closestNode.parentInPath
    while(not (parent==None)):
        path.append(parent)
        parent = parent.parentInPath
    for p in path:
        print(p.val)
else:
    print("Manual path not found.")

print("================================")
print("--- DOUBLE axis kd tree test ---")
kdtree = KDTree(value=(1,1), doubleTree=True)
ndPrev = kdtree.xroot

print(">>> INSERT ---")
nd = Node(value=(0,5))
nd.parentInPath = ndPrev
kdtree.insert(nd)
ndPrev = nd

nd = Node(value=(2,2))
nd.parentInPath = ndPrev
kdtree.insert(nd)
ndPrev = nd

nd = Node(value=(3,-5))
nd.parentInPath = ndPrev
kdtree.insert(nd)
ndPrev = nd

nd = Node(value=(4,-20))
nd.parentInPath = ndPrev
kdtree.insert(nd)
ndPrev = nd

print(">>> SEARCH ---")
nd = Node(value=(2,2))
nd, flag, _, treeType = kdtree.search(nd, 2)
print(nd.val, " ", flag, treeType)

nd = Node(value=(2.1,2.1))
nd, flag, _, treeType = kdtree.search(nd, 2)
print(nd.val, " ", flag, treeType)

nd = Node(value=(3.1,-5.1))
nd, flag, _, treeType = kdtree.search(nd, 0.2)
print(nd.val, " ", flag, treeType)

nd = Node(value=(-13,-13))
nd, flag, _, treeType = kdtree.search(nd, 999)
print(nd.val, " ", flag, treeType)

nd = Node(value=(-13,-13))
nd, flag, _, treeType = kdtree.search(nd, 0.2)
print(nd.val, " ", flag, treeType)

print(">>> PATH KD ---")
nd = Node(value=(4,-20))
closestNode, distFlag, pathKD, treeType = kdtree.search(nd, 0.001, getPathKD=True)
if(distFlag):
    print("Path Retrieved: ", path)
    for p in path:
        print(p.val)
else:
    print("Path not found.")

print(">>> REVERSE PATH ACC. MANUAL PARENT NODES ---")
path = []
# nd = Node(value=(4,4))
nd = Node(value=(4,-20))
closestNode, distFlag, pathKD, _ = kdtree.search(nd, 0.001, getPathKD=True)
if(distFlag):
    print("Manual path found.")
    path.append(closestNode)
    parent = closestNode.parentInPath
    while(not (parent==None)):
        path.append(parent)
        parent = parent.parentInPath
    for p in path:
        print(p.val)
else:
    print("Manual path not found.")

print("Test Done")