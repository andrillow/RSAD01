# Multivariate analysis in R with satellite data

library(terra)
library(imageRy)

im.list()
Sentinel <- im.import("sentinel.png")
Sentinel <- c(Sentinel[[1]], Sentinel[[2]], Sentinel[[3]])

# Principal Components Analysis (PCA)
sample <- spatSample(Sentinel, 100) # sample 100 points from the image
sample
Sentinel_PCA <- prcomp (sample) # perform the PCA
summary(Sentinel_PCA)
