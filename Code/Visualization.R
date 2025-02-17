# Code for visualizing satellite images

library(terra)
library(imageRy)

# importing data from ImageRy (Sentibel bands)
im.list()

b2<- im.import("sentinel.dolomites.b2.tif")

par(mfrow=c(1,3))

cl <- colorRampPalette(c("cyan", "chocolate", "chartreuse")) (1000)
plot(b2, col=cl)
cl <- colorRampPalette(c("cyan", "chocolate", "chartreuse")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("cyan", "chocolate", "chartreuse")) (3)
plot(b2, col=cl)

# try with more colors
par(mfrow=c(1,3))

dev.off() # turn off things that are open before opening new stuff
cl <- colorRampPalette(c("darkorchid3", "cyan", "chartreuse", "chocolate", "darkgoldenrod1")) (1000)
plot(b2, col=cl)
cl <- colorRampPalette(c("darkorchid3", "cyan", "chartreuse", "chocolate", "darkgoldenrod1")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("darkorchid3", "cyan", "chartreuse", "chocolate", "darkgoldenrod1")) (3)
plot(b2, col=cl)

setwd(C:/Users/andreanocentini/OneDrive - Seminole Tribe Of Florida/Desktop/)
