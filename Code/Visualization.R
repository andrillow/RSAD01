# Code for visualizing satellite images

library(terra)
library(imageRy)

# importing data from ImageRy
im.list()

b2<- im.import("sentinel.dolomites.b2.tif")

# Sentinel bands
