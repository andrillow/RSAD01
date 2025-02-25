# Calculating spectral indices from satellite images

library(terra)
library(imageRy)
library(viridis)

im.list()

mato1992 <- im.import("matogrosso_l5_1992219.lrg.jpg") #band 1= NIR, band 2= red, band 3= green
mato2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

par(mfrow=c(1,2))
im.plotRGB(mato1992, r=1, g=2, b=3, title="Mato Grosso 1992")
im.plotRGB(mato2006, r=1, g=2, b=3, title="Mato Grosso 2006")

# six-panel figure for comparison
par(mfrow=c(3,2))
im.plotRGB(mato1992, r=1, g=2, b=3, title="Mato Grosso 1992_NIR on red")
im.plotRGB(mato2006, r=1, g=2, b=3, title="Mato Grosso 2006_NIR on red")
im.plotRGB(mato1992, r=2, g=1, b=3, title="Mato Grosso 1992_NIR on green")
im.plotRGB(mato2006, r=2, g=1, b=3, title="Mato Grosso 2006_NIR on green")
im.plotRGB(mato1992, r=3, g=2, b=1, title="Mato Grosso 1992_NIR on blue")
im.plotRGB(mato2006, r=3, g=2, b=1, title="Mato Grosso 2006_NIR on blue")

# calculating and plotting spectral indices
dvi_1992 <- mato1992[[1]] - mato1992[[2]]
dev.off()
plot(dvi_1992)
dvi_1992 <- im.dvi(mato1992, 1, 2) #alternative function for calculating dvi within the imageRy package
dvi_2006 <- im.dvi(mato2006, 1, 2)
par(mfrow=c(1,2))
plot(dvi_1992)
plot(dvi_2006)
plot(dvi_1992, col=magma(100)) #use alternative colors from the viridis package
plot(dvi_2006, col=magma(100))

# range of images (depending on the number of bits of the image)
dev.off()
plot(mato2006) # range of 0-256 equals to an 8 bit image (2^8=256)
ncell(mato2006) # count number of pixels

# using the normalized vegetation index (NDVI) to compare images with different resolutions (bits)
ndvi_1992 <- im.ndvi(mato1992, 1, 2)
ndvi_2006 <- im.ndvi(mato2006, 1, 2)
par(mfrow=c(1,2))
plot(ndvi_1992, col=mako (100))
plot(ndvi_2006, col=mako (100))

# compare dvi and ndvi maps
par(mfrow=c(2,2))
plot(dvi_1992, col=mako (100))
plot(dvi_2006, col=mako (100))
plot(ndvi_1992, col=mako (100))
plot(ndvi_2006, col=mako (100))










