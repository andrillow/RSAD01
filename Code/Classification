# classify data

library(terra)
library(imageRy)

setwd("C:/Users/andreanocentini/OneDrive - Seminole Tribe Of Florida/Desktop/RSAD01/")
arctic <- rast("ellesmere_oli_2014172_lrg.jpg")
plot(arctic)
arctic <- flip(arctic) #flip the image if needed
plot(arctic)

# get band values
values_arctic <- values(arctic)
values_arctic
head(values_arctic)

# calculate k-mean clusters
k_means_arctic <- kmeans(values_arctic, centers=3)
k_means_arctic$cluster

# land cover map based on the classification
arctic_cover <- setValues(arctic[[1]], k_means_arctic$cluster)
plot(arctic_cover)

# land cover map using a function from imageRy
arctic_cover2 <- im.classify(arctic, num_clusters=3) #set a seed to avoid variations in the output
plot(arctic_cover2)

# classify the Mato Grosso images
im.list()
mato1992 <- im.import("matogrosso_l5_1992219.lrg.jpg") #band 1= NIR, band 2= red, band 3= green
mato2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
mato1992_classes <- im.classify(mato1992, num_clusters=2, seed=4)
#interpretation: 1 equals forests and 2 equals human-impacted areas
mato1992_classes_renamed <- subst (mato1992_classes, c(1,2), c("forest", "human-impacted"))
mato2006_classes <- im.classify(mato2006, num_clusters=2, seed=4)
mato2006_classes_renamed <- subst (mato2006_classes, c(1,2), c("human-impacted", "forest"))
par(mfrow=c(1,2))
plot(mato1992_classes_renamed)
plot(mato2006_classes_renamed)

# calculate relative covers by class
frequency1992 <- freq(mato1992_classes_renamed)
percentage1992 <- frequency1992$count/ncell(mato1992_classes_renamed)*100
frequency2006 <- freq(mato2006_classes_renamed)
percentage2006 <- frequency2006$count/ncell(mato2006_classes_renamed)*100

# insert data into a dataframe
cover <- c("forest", "human-impacted")
perc1992 <- percentage1992
perc2006 <- percentage2006
mato_grosso_df <- data.frame(cover, perc1992, perc2006)


