import pdb
from userUtils import Node
from userUtils import KDTree

kdtree = KDTree(value=(1,1))

nd = Node(value=(0,0))
kdtree.insert(nd)
nd = Node(value=(2,2))
kdtree.insert(nd)
nd = Node(value=(3,3))
kdtree.insert(nd)
nd = Node(value=(4,4))
kdtree.insert(nd)

nd = Node(value=(2,2))
(nd, flag) = kdtree.search(nd, 2)
print(nd.val, " ", flag)

nd = Node(value=(2.1,2.1))
(nd, flag) = kdtree.search(nd, 2)
print(nd.val, " ", flag)

nd = Node(value=(3.1,3.1))
(nd, flag) = kdtree.search(nd, 0.2)
print(nd.val, " ", flag)

nd = Node(value=(-13,-13))
(nd, flag) = kdtree.search(nd, 999)
print(nd.val, " ", flag)

nd = Node(value=(-13,-13))
(nd, flag) = kdtree.search(nd, 0.2)
print(nd.val, " ", flag)

# pdb.set_trace()

print("Test Done")