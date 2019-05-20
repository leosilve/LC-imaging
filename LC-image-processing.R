# This script imports images from file
library(magick)
library(ggplot2)
library(grid)
library(gridExtra)
library(imager)
bitsToInt<-function(x) {
  packBits(rev(c(rep(FALSE, 32-length(x)%%32), as.logical(x))), "integer")
}
# The images I saved have 8bit color depth, i.e. for each color the intensity ranges between 0 and 255
# Clear explanation https://computergraphics.stackexchange.com/questions/5085/light-intensity-of-an-rgb-value
# I can calculate the intensity if I know the wavelength, maybe?  

myImageFilename <- '~/OneDrive - UNSW/Data/Microscope/2019_05_17/22.5deg_1V.bmp'
myImage <- load.image(myImageFilename)
plot(myImage) # Shows it
dim(myImage)
imsplit(myImage,"c") %>% average %>% plot(main="Averaging colour channels")
myImage.height
plot(imsub(myImage,x > 320 ,y > 250))
plot(R(myImage))
plot(G(myImage))
plot(B(myImage))
#R(parrots) is equivalent to channel(parrots,1)

#Set all channels to 0 except red
G(myImage) <- 0
B(myImage) <- 0
plot(myImage)

myImage <- image_read('~/OneDrive - UNSW/Data/Microscope/5x_condenser_focused.bmp')
print(myImage)
image_info(myImage)
myImageData <- image_data(myImage)
mandrill <- myImage

myImage <- image_read('/Users/leocam/Downloads/5x_condenser_focused.tiff')





dim(myImageData)
myImageData[3,640,480] # First is the color (RGB), second row, third column
testImage <- image_convert(image_blank(600, 400, "white"),format = "BMP",colorspace = "sRGB",depth=8)
image_info(testImage)
testImageData <- image_data(testImage)
dim(testImageData)
typeof(testImageData[3,1,1])
rawToBits(testImageData[3,1,1])[1]
bitsToInt(rawToBits(testImageData[3,1,1]))
testImage <- image_convert(image_blank(640, 480, "black"),format = "BMP",colorspace = "sRGB",depth=8)

