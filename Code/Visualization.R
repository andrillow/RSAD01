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
dev.off()
cl <- colorRampPalette(c("darkorchid3", "cyan", "chartreuse", "chocolate", "darkgoldenrod1")) (100)
plot(b2, col=cl)

# set the working directory and export map as png
setwd("C:/Users/andreanocentini/OneDrive - Seminole Tribe Of Florida/Desktop/RSAD01/")
png("b2.png")
plot(b2)
dev.off()

# export as a multi-panel figure
png("b2_multi.png")
par(mfrow=c(1,3))
cl <- colorRampPalette(c("cyan", "chocolate", "chartreuse")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("darkorchid3", "cyan", "chartreuse", "chocolate", "darkgoldenrod1")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("palegreen", "seagreen", "chartreuse", "darkolivegreen4", "aquamarine3")) (100)
plot(b2, col=cl)
dev.off()

png("b2_multi2.png")
par(mfrow=c(3,1))
cl <- colorRampPalette(c("cyan", "chocolate", "chartreuse")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("darkorchid3", "cyan", "chartreuse", "chocolate", "darkgoldenrod1")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("palegreen", "seagreen", "chartreuse", "darkolivegreen4", "aquamarine3")) (100)
plot(b2, col=cl)
dev.off()



