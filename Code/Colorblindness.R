# Code for simulating and solving colorblindness issues

library(terra)
library(imageRy)
library(patchwork)

im.list()
Dolomites <- im.import("sentinel.dolomites")
NDVI <- im.ndvi(Dolomites, 4, 3)

# plot using different color ramps
color1 <- colorRampPalette(c("black", "darkgrey", "lightgrey")) (100)
color2 <- colorRampPalette(c("blue", "white", "red")) (100)
color3 <- colorRampPalette(c("brown", "yellow", "green")) (100)
par(mfrow=c(3,1))
plot(NDVI, col=color1)
plot(NDVI, col=color2)
plot(NDVI, col=color3)
dev.off()

# ramp not visible by colorblind people
color1_blind <- colorRampPalette(c("red", "green", "blue")) (100)
plot(NDVI, col=color1_blind)
color2_blind <- colorRampPalette(c("blue", "green", "yellow")) (100)
plot(NDVI, col=color2_blind)

# change ramp to make it visible by colorblind people
par(mfrow=c(2,1))
palraw <- colorRampPalette(c("red", "orange", "red", "chartreuse", "cyan",
                             "blue"))(100)
palraw_grey <- colorRampPalette(c("darkorange", "orange", "grey", "darkgrey",
                                  "lightgrey", "blue"))(100)
plot(NDVI, col=palraw)
plot(NDVI, col=palraw_grey)

# Reproducing color blind vision
setwd("C:/Users/andreanocentini/OneDrive - Seminole Tribe Of Florida/Desktop/RSAD01/Data/")
vinicunca <- rast("vinicunca.jpg")
vinicunca <- flip(vinicunca)
plot(vinicunca)
par(mfrow=c(2,1))
vinicunca_RGB1 <- im.plotRGB(vinicunca, 1, 2, 3, title="Standard")
vinicunca_RGB2 <- im.plotRGB(vinicunca, 3, 2, 1, title="Protanopia")
library(colorblindcheck)
color_rainbow <- rainbow(100) # set the number of colors
palette_check(color_rainbow, plot=TRUE)
library(colorblindr)
iris_plot <- ggplot(iris, aes(Sepal.Length, fill=Species)) +
             geom_density(alpha=0.4)
iris_plot
cvd_grid(iris_plot) # check how colorblind people see the plot
iris_plot2 <- ggplot(iris, aes(Sepal.Length, fill=Species)) +
              geom_density(alpha=0.4) + scale_fill_OkabeIto()
iris_plot2
iris_plot + iris_plot2
dev.off()

# addressing the color blind issue
rainbow <- rast("rainbow.jpg")
rainbow <- flip(rainbow)
plot(rainbow)
library(cblindplot)
cblind.plot(rainbow, cvd="protanopia")
cblind.plot(rainbow, cvd="deuteranopia")
cblind.plot(rainbow, cvd="tritanopia")
