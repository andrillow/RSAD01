# Code for visualizing satellite images

library(terra)
library(imageRy)

# importing data from ImageRy (Sentibel bands)
im.list()

b2<- im.import("sentinel.dolomites.b2.tif")

cl <- colorRampPalette(c("cyan", "chocolate", "coral")) (75)
plot(b2, col=cl)
