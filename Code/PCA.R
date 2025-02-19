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
PCA_predicted_map <- predict(Sentinel, Sentinel_PCA, index=c(1:3))
plot(PCA_predicted_map)

# PCA with a different dataset, sampling a higher number of points
Dolomites <- im.import("sentinel.dolomites")
sample <- spatSample(Dolomites, 1000) # sample 100 points from the image
sample
Dolomites_PCA <- prcomp (sample) # perform the PCA
summary(Dolomites_PCA)
PCA_predicted_map2 <- predict(Dolomites, Dolomites_PCA, index=c(1:4))
plot(PCA_predicted_map2)

# PCA using the imageRy package
Sentinel_PCA_im <- im.pca(Sentinel)
Dolomites_PCA_im <- im.pca(Dolomites, 100, 4) # setting number of samples and number of components to map

# calcualting variability of the first principal component
var_Sentinel_PCA_im <- focal(Sentinel_PCA_im[[1]], matrix(1/9,3,3), fun=sd)
var_Dolomites_PCA_im <- focal(Dolomites_PCA_im[[1]], matrix(1/9,3,3), fun=sd)
var_Sentinel_PCA_im_p <- im.ggplot(var_Sentinel_PCA_im)
var_Dolomites_PCA_im_p <- im.ggplot(var_Dolomites_PCA_im)
