import math
import random

'''
Circular Domain Increments
Concentrically increase domain, while sampling only in the added increment. 
If too many failed points are generated (ie. too many points are generated outside the domain)
then stop expanding the domain and sample from the entire domain rather than just the increment portion
'''
def pointFromPeri(radiusInner, radiusOuter, center, limits, maxTriesLimit, maxTriesFlag):

    triesCtr = 0
    validPt = False
    # maxTriesFlag = False # Don't reset this flag. Once domain limit is reached, just use full domain
    while(not validPt):

        rad = random.uniform(radiusInner, radiusOuter)
        print("rad: ", rad)
        peri = 2*math.pi*rad
        # print("peri: ", peri)
        prm = random.uniform(0, peri)
        # print("prm: ", prm)

        # Circle defined as per anti-clockwise angle from the x axis
        angle = 2*math.pi* (prm/peri)
        x = rad*math.cos(angle)
        y = rad*math.sin(angle)

        # print("limits: ", limits)
        if(x>=limits[0] and x<=limits[1] and y>=limits[2] and y<=limits[3]):
            validPt = True
        else:
            triesCtr += 1
            print("Invalid Pt: ", (x,y))

        if(triesCtr > maxTriesLimit):
            maxTriesFlag = True
            break
    
    pt = (x,y)
    # print("pt: ", pt)
    x = x + center[0]
    y = y + center[1]
    pt = (x,y)
    # print("pt: ", pt)
    return pt, maxTriesFlag


xStart = 500
yStart = 500
center = (xStart, yStart)
map_width = 20 # 0.1
map_height = 20 # 0.1
limits = (-map_width/2.0, +map_width/2.0, -map_height/2.0, +map_height/2.0) # xmin, xmax, ymin, ymax

radiusOuter = 0
radiusInner = radiusOuter
radiusInc = 5
perimeterInner = 0
perimeterOuter = 0

# Flag to check if domain should stop expanding due to constant out of bounds error.
# ie. Domain is pretty much the size of global domain
maxTriesFlag = False
maxTriesLimit = 200
totSamples = 50
radiusIncBatch = 10
ctr = 0
while(ctr < totSamples):
    print("---")
    if( (not maxTriesFlag) and ctr % radiusIncBatch == 0):
        print("=====")
        radiusInner = radiusOuter
        radiusOuter += radiusInc
    
    pt, maxTriesFlag = pointFromPeri(radiusInner, radiusOuter, center, limits, maxTriesLimit, maxTriesFlag)

    if(not maxTriesFlag): # Valid point
        print("POINT: ", pt)
    else: # Failed to generate points. Reached limit. Start generating points over full domain now
        print(">>> Reached the domain limit. Using entire domain now.")
        radiusInner = 0

    ctr += 1




# More confusing rectangular limits
    
# xStart = 0
# yStart = 0

# mainLoop = 5000

# domainIncModulus = 100
# domainCtr = 0
# xDomInc = 0.3
# yDomInc = 0.3
# xDomCenter = xStart
# yDomCenter = yStart
# xDomCurr = xDomCenter
# yDomCurr = yDomCenter
# # xDomCurr = xDomCenter + (domainCtr+1) * xDomInc
# # yDomCurr = yDomCenter + (domainCtr+1) * yDomInc
# # prevXDom = xDomCurr
# # prevYDom = yDomCurr
# xDomMax = map_width/2
# yDomMax = map_height/2

# ctr = 0
# while (ctr < mainLoop):

#     if(mainLoop % domainIncModulus == 0):
#         domainCtr += 1
#         prevXDom = xDomCurr
#         prevYDom = yDomCurr
#         xDomCurr = xDomCenter + (domainCtr+1) * xDomInc
#         yDomCurr = yDomCenter + (domainCtr+1) * yDomInc

#         if(xDomCurr > xDomMax):
#             xDomCurr = xDomMax

#     # tuple = (xmin, xmax, ymin, ymax)
#     domVertRight = (prevXDom, xDomCurr, -yDomCurr, yDomCurr)
#     domVertLeft = (-xDomCurr, -prevXDom, -yDomCurr, yDomCurr)
#     domHorizUp = (-prevXDom, +prevXDom, prevYDom, yDomCurr)
#     domHorizDown = (-prevXDom, +prevXDom, -prevYDom, -yDomCurr)
#     domain = (domVertRight, domVertLeft, domHorizUp, domHorizDown) # Positives first among each type

#     sample = generateSamples(domain)




