# Time series analysis

library(terra)
library(imageRy)
library(viridis)
library(colorist)

im.list()
EN01 <- im.import("EN_01.png")
EN01 <- flip(EN01)
EN13 <- im.import("EN_13.png")
EN13 <- flip(EN13)
EN01RGB <- ggRGB(EN01, 1, 2, 3)
EN13RGB <- ggRGB(EN13, 1, 2, 3)
EN01RGB / EN13RGB

# map temporal change by using the difference operator
EN_difference <- EN13 [[1]] - EN01 [[1]]
plot(EN_difference)

# Greenland ice melt data
Greenland <- im.import("greenland")
Greenland_difference <- Greenland[[1]] - Greenland [[4]]
plot(Greenland_difference, col=mako(100))

Greenland_RGB <- im.plotRGB(Greenland, 1, 2, 4)

# colorist package to overlap color maps
data("fiespa_occ")
Fiespa_metrics <- metrics_pull(fiespa_occ)
Fiespa_palette <- palette_timecycle(fiespa_occ)







