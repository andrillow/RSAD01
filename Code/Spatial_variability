# Code to measure spatial variability considering both (i) spectral indices and (ii) relative abudances

library(terra)
library(imageRy)
library(rasterdiv)

im.list()
glacier_image <- im.import("sentinel.png")
glacier_image <- c(glacier_image [[1]], glacier_image [[2]], glacier_image [[3]])
glacier_RGB <- im.plotRGB(glacier_image, 1, 2, 3, title="NIR on red component")
glacier_RGB2 <- im.plotRGB(glacier_image, 3, 1, 2, title="NIR on green component")
glacier_RGB2 <- im.plotRGB(glacier_image, 3, 2, 1, title="NIR on blue component")

# Calculate standard deviation
# Formula: sqrt(sum((x - mean(x))^2) / n)
# Variance: SD^2
NIR <- glacier_image [[1]]
Variability1a <- focal(NIR, matrix(1/9,3,3), fun=sd)
plot(Variability1a)
Variability1b <- focal(NIR, matrix(1/25,5,5), fun=sd)
plot(Variability1b)
Variability1c <- focal(NIR, matrix(1/49,7,7), fun=sd)
plot(Variability1c)
im.ggplot(Variability) #same map using ggplot
Variability2 <- focal(NIR, matrix(1/9,3,3), fun=var) # using variance instead of standard deviation
plot(Variability2)
# Standard deviation versus variance
par(mfrow=c(1,2))
plot(Variability1a)
plot(Variability2)
dev.off()

# Shannon index: abundance-based method
Shannon_diversity <- Shannon(NIR, window=3, na.tolerance=0) # avoid with continuous, high-resolution data; 0 NA tolerance removes the edge effect
plot(Shannon_diversity)im.ggplot(Shannon_diversity)
Shannon_diversity_ggplot <- 
plot(Shannon_diversity_ggplot)

# Cropping the image
extent <- c(0, 100, 0, 100)
cropped_NIR <- crop(NIR, extent)
plot(cropped_NIR)
cropped_NIR_ggplot <- im.ggplot(cropped_NIR)
NIR_ggplot <- im.ggplot(NIR)
NIR_ggplot + cropped_NIR_ggplot

# Aggreagating pixels to move to a lower resolution
aggregated_NIR <- aggregate(NIR, fact=5)
plot(aggregated_NIR)
aggregated_NIR_ggplot <- im.ggplot(aggregated_NIR)
NIR_ggplot + aggregated_NIR_ggplot

# Re-calculation the Shannon index with a lower resolution image
Shannon_diversity_low <- Shannon(aggregated_NIR, window=3, na.tolerance=0)
plot(Shannon_diversity_low)
Shannon_diversity_low_ggplot <- im.ggplot(Shannon_diversity_low)
Shannon_diversity_ggplot + Shannon_diversity_low_ggplot

# Shannon is a point descriptor, hence better use the Renyi function, which tests for multiple indeces
Renyi_indices <- Renyi(aggregated_NIR, window=3, alpha=seq(0,12,4), na.tolerance=0.2)

# Rao's Q uses both distance statistics as SD together with abundance data


