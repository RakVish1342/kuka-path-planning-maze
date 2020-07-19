import pdb
from userUtils import Node
from userUtils import KDTree

print("--- SINGLE axis kd tree test ---")
kdtree = KDTree(value=(1,1))

print(">>> INSERT ---")
nd = Node(value=(0,0))
kdtree.insert(nd)
nd = Node(value=(2,2))
kdtree.insert(nd)
nd = Node(value=(3,-5))
kdtree.insert(nd)
nd = Node(value=(4,20))
kdtree.insert(nd)

print(">>> SEARCH ---")
nd = Node(value=(2,2))
nd, flag, _, _ = kdtree.search(nd, 2)
print(nd.val, " ", flag)

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

print(">>> PATH ---")
# nd = Node(value=(4,4))
nd = Node(value=(4,20))
closestNode, distFlag, path, _ = kdtree.search(nd, 0.001, getPath=True)
if(distFlag):
    print("Path Retrieved: ", path)
    for p in path:
        print(p.val)
else:
    print("Path not found.")



print("--- DOUBLE axis kd tree test ---")
kdtree = KDTree(value=(1,1), doubleTree=True)

# pdb.set_trace()

print(">>> INSERT ---")
nd = Node(value=(0,5))
kdtree.insert(nd)
nd = Node(value=(2,2))
kdtree.insert(nd)
nd = Node(value=(3,-5))
kdtree.insert(nd)
nd = Node(value=(4,-20))
kdtree.insert(nd)

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

# nd = Node(value=(-13,-13))
# nd, flag, _ = kdtree.search(nd, 0.2)
# print(nd.val, " ", flag)

# print(">>> PATH ---")
# # nd = Node(value=(4,4))
# nd = Node(value=(4,20))
# closestNode, distFlag, path = kdtree.search(nd, 0.001, getPath=True)
# if(distFlag):
#     print("Path Retrieved: ", path)
#     for p in path:
#         print(p.val)
# else:
#     print("Path not found.")

print("Test Done")