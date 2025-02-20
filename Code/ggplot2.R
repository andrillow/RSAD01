# Code to use ggplot2 to plot satellite images

library(terra)
library(imageRy)
library(RStoolbox)
library(patchwork)

im.list()
mato1992 <- im.import("matogrosso_l5_1992219.lrg.jpg") #band 1= NIR, band 2= red, band 3= green
mato2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# Single layers
map_1992<- im.ggplot(mato1992[[1]])
map_2006 <- im.ggplot(mato2006[[1]])
map_1992 + map_2006 # plot the two maps together using the patchwork package

# ggplot2 for RGB space: the ggRGB function
RGB_plot_1992a <- ggRGB(mato1992, r=1, g=2, b=3)
RGB_plot_2006a <- ggRGB(mato2006, r=1, g=2, b=3)
RGB_plot_1992b <- ggRGB(mato1992, r=2, g=3, b=1)
RGB_plot_2006b <- ggRGB(mato2006, r=2, g=3, b=1)
RGB_plot_1992c <- ggRGB(mato1992, r=2, g=1, b=3)
RGB_plot_2006c <- ggRGB(mato2006, r=2, g=1, b=3)
(RGB_plot_1992a + RGB_plot_2006a) / (RGB_plot_1992b + RGB_plot_2006b) / (RGB_plot_1992c + RGB_plot_2006c)

# Stretching to enhance colors and highlight differences
mato2006_stretch <- ggRGB(mato2006, r=1, g=2, b=3, stretch="lin")
mato2006_hist <- ggRGB(mato2006, r=1, g=2, b=3, stretch="hist")
mato2006_sqrt <- ggRGB(mato2006, r=1, g=2, b=3, stretch="sqrt") # ideal for very dark images to brightening
mato2006_log <- ggRGB(mato2006, r=1, g=2, b=3, stretch="log") # ideal for very dark images to brightening
plot(mato2006_stretch)
plot(mato2006_hist)
plot(mato2006_sqrt)
plot(mato2006_log)
