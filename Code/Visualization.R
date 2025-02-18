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

# export as a multi-panel figure, also as pdf
png("b2_multi.png") # first multi-panel figure
par(mfrow=c(1,3))
cl <- colorRampPalette(c("cyan", "chocolate", "chartreuse")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("darkorchid3", "cyan", "chartreuse", "chocolate", "darkgoldenrod1")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("palegreen", "seagreen", "chartreuse", "darkolivegreen4", "aquamarine3")) (100)
plot(b2, col=cl)
dev.off()
png("b2_multi2.png") # second multi-panel figure
par(mfrow=c(3,1))
cl <- colorRampPalette(c("cyan", "chocolate", "chartreuse")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("darkorchid3", "cyan", "chartreuse", "chocolate", "darkgoldenrod1")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("palegreen", "seagreen", "chartreuse", "darkolivegreen4", "aquamarine3")) (100)
plot(b2, col=cl)
dev.off()
pdf("b2_multi3.pdf") # third multi-panel figure
par(mfrow=c(2,2))
cl <- colorRampPalette(c("cyan", "chocolate", "chartreuse")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("darkorchid3", "cyan", "chartreuse", "chocolate", "darkgoldenrod1")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("palegreen", "seagreen", "chartreuse", "darkolivegreen4", "aquamarine3")) (100)
plot(b2, col=cl)
cl <- colorRampPalette(c("grey97", "grey80", "grey60", "grey30", "black")) (100)
plot(b2, col=cl)
dev.off()

# importing other Sentinel bands from ImageRy
b3<- im.import("sentinel.dolomites.b3.tif") # green band(550 nm)
b4<- im.import("sentinel.dolomites.b4.tif") # red band (665 nm)
b8<- im.import("sentinel.dolomites.b8.tif") # NIR band (842 nm; human vision extends only until a bit past 700 nm)

# generate a stack
sentinel_stack <- c(b2, b3, b4, b8)
plot(sentinel_stack)

# check for correlations between bands
pairs(sentinel_stack)

# print the stack object information
sentinel_stack

# plot using a grey scale
cl <- colorRampPalette(c("grey97", "grey80", "grey60", "grey30", "black")) (100)
plot(sentinel_stack, col=cl)

# plot using RGB
im.plotRGB(sentinel_stack, r=3, g=2, b=1, title="Natural color image")

