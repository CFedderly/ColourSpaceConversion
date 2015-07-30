/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 */

#include <stdio.h>
#include <stdlib.h>
#include "image.c"
#include "image.h"

int main(int argc, char* argv[]) {


	if (argc != 2) {
		printf("Usage: ./rgb_to_ycc <bmp_file_name>\n");
		exit(-1);
	}

	bmp_info* bmp = mmalloc(sizeof(bmp_info));
	rgb_prime_array* rgb = mmalloc(sizeof(rgb_prime_array));

	get_bmp(argv[1], bmp, rgb);

	if (rgb->bits_per_px == 24) {
		
		YCC_prime_t** ycc = mmalloc(sizeof(YCC_prime_t*) * rgb->height);
		RGB_prime_t** rgb_arr = rgb->data_array; 
		YCC_prime_t* temp = mmalloc(sizeof(YCC_prime_t));

		unsigned char r, g, b, y, cb, cr;
		int i, j;
		// for every row of pixels
		for (i = 0; i < rgb->height; i++) {
			// allocate a RGB object for each pixel
			ycc[i] = mmalloc(rgb->width * sizeof(YCC_prime_t));
			for (j = 0; j < rgb->width; j++) {
				r = rgb_arr[i][j].red * RGB_FIXED;
				g = rgb_arr[i][j].green * RGB_FIXED;
				b = rgb_arr[i][j].blue * RGB_FIXED;
				// to optimize, store constants as ... constants
				// WRONG:
				// smaller power of 2 greater than max constant (0.439) is 1 
				// to provide the right granularity (0.001) for the constants, need 10 bits (2^10)
				// RGB values are 8 bit (2^8)
				// 2^8 * 2^10 = 2^18 -> require 11 bits for YCC => shift by 7 bits
				y = ((int) (0.257 * 4096) * r + (int) (0.504 * 4096) * g + (int) (0.098 * 4096) * b) >> 11;
				cb = ((int)(-0.148 * 4096) * r - (int) (0.291 * 4096) * g + (int) (0.439 * 4096) * b) >> 11;
				cr = ((int) (0.439 * 4096) * r - (int) (0.368 * 4096) * g - (int) (0.071 * 4096) * b) >> 11;
				//printf("y: %d cb: %d cr: %d\n", y, cb, cr);
				temp->y = ((float) y) / 2048 + 16.0f;
				temp->cb = ((float) cr) / 2048 + 128.0f;
				temp->cr = ((float) cb) / 2048 + 128.0f;

				ycc[i][j] = *temp;
				
				//printf("%d %d y: %f cb: %f cr: %f\n", i, j, ycc[i][j].y, ycc[i][j].cb, ycc[i][j].cr);
			}
		}

		free(ycc);
		free(temp);

	} else {
		printf("Can only read 24bpp bmp files to convert from rgb to ycc.\n");
	}

	free(rgb->data_array);
	free(rgb);
	free(bmp);

	return 0;
}