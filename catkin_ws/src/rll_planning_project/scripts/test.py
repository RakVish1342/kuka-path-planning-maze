import pdb
import userUtils

kdtree = userUtils.KDTree(value=(1,1))
kdtree.insert(value=(0,0))
kdtree.insert(value=(2,2))
kdtree.insert(value=(3,3))
kdtree.insert(value=(4,4))

(pt, flag) = kdtree.search((2,2), 2)
print(pt, " ", flag)
(pt, flag) = kdtree.search((2.1,2.1), 2)
print(pt, " ", flag)
(pt, flag) = kdtree.search((3.1,3.1), 0.2)
print(pt, " ", flag)

# pdb.set_trace()

print("Test Done")