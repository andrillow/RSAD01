# Time series analysis

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()
EN01 <- im.import("EN_01.png")
EN01 <- flip(EN01)
EN13 <- im.import("EN_13.png")
EN13 <- flip(EN13)
EN01RGB <- ggRGB(EN01, 1, 2, 3)
EN13RGB <- ggRGB(EN13, 1, 2, 3)
EN01RGB / EN13RGB
