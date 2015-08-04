# ColourSpaceConversion

Given a bmp image, will convert from RGB to YCC, then back to RGB. Output will be the image after conversion and re-conversion in the file "converted.bmp".  

Only works for 24bpp bmp files.  

## Usage:  

To compile:  
  
make  

To run:  
  
./csc \<name of bmp file to convert\>

## Required files:  
Makefile  
colour_space_conversion.c  
image.h  
image.c  
ycc_to_rgb.c  
rgb_to_ycc.c  

