# Plotting data in scatter plots using hexagon binning

library(terra)
library(imageRy)
library(hexbin)
library(ggplot2)

im.list()
Dolomites <- im.import("sentinel.dolomites")
plot(Dolomites[[1]], Dolomites[[2]])
pairs(Dolomites)

# hexagon binning
NDVI <- im.import("_NDVI_20")
par(mfrow=c(3,1))
plot(NDVI[[2]])
plot(NDVI[[3]])
plot(NDVI[[2]], NDVI[[3]], xlim=c(-0.4, 0.8), ylim=c(-0.4, 0.8), xlab="May", ylab="August")
abline(0, 1, col="red")
dev.off()
NDVI_may <- as.data.frame(NDVI[[2]])
NDVI_august <- as.data.frame(NDVI[[3]])
NDVI_HB <- hexbin(NDVI_may[[1]], NDVI_august[[1]], xbins=100)
plot(NDVI_HB)
NDVI_HB2 <- ggplot(data.frame(x=NDVI_may[[1]], y=NDVI_august[[1]]), aes(x=x, y=y)) +
            geom_hex() +
            scale_fill_viridis(option="mako")
NDVI_HB2  # 
