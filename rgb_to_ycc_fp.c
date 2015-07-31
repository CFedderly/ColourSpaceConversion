/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 */

#include <stdio.h>
#include <stdlib.h>
#include "image.c"
#include "image.h"

void convert_ycc_to_rgb(YCC_prime_t**, rgb_array*);

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

		int32_t r, g, b, y, cb, cr;
		float division = (float) 1 / 512;
		int i, j;
		// for every row of pixels
		for (i = 0; i < rgb->height; i++) {
			// allocate a RGB object for each pixel
			ycc[i] = mmalloc(rgb->width_px * sizeof(YCC_prime_t));
			for (j = 0; j < rgb->width_px; j++) {
				r = rgb_arr[i][j].red * RGB_FIXED;
				g = rgb_arr[i][j].green * RGB_FIXED;
				b = rgb_arr[i][j].blue * RGB_FIXED;
				// to optimize, store constants as ... constants
				// WRONG:
				// smaller power of 2 greater than max constant (0.439) is 1 
				// to provide the right granularity (0.001) for the constants, need 10 bits (2^10)
				// RGB values are 8 bit (2^8)
				// 2^8 * 2^10 = 2^18 -> require 11 bits for YCC => shift by 7 bits
				//printf("r: %d g: %d b: %d\n", r, g, b);
				y = ((int) (0.257 * 4096) * r + (int) (0.504 * 4096) * g + (int) (0.098 * 4096) * b) >> 13;
				cb = ((int)(-0.148 * 4096) * r - (int) (0.291 * 4096) * g + (int) (0.439 * 4096) * b) >> 13;
				cr = ((int) (0.439 * 4096) * r - (int) (0.368 * 4096) * g - (int) (0.071 * 4096) * b) >> 13;
				//printf("%f y: %d cb: %d cr: %d\n", division, y, cb, cr);
				temp->y = y * division + 16.0f;
				temp->cb = cb * division + 128.0f;
				temp->cr = cr * division + 128.0f;

				ycc[i][j] = *temp;
				y = cb = cr = 0;
				r = g = b = 0;
				printf("%d %d y: %f cb: %f cr: %f\n", i, j, ycc[i][j].y, ycc[i][j].cb, ycc[i][j].cr);
			}
		}
		free(temp);
		
		rgb_array* rgb_after = malloc(sizeof(rgb_array));

		rgb_after->bits_per_px = rgb->bits_per_px;
		rgb_after->width_px = rgb->width_px;
		rgb_after->height = rgb->height;
		convert_ycc_to_rgb(ycc, rgb_after);

		free(ycc);
		free(rgb_after->data_array);
		free(rgb_after);

	} else {
		printf("Can only read 24bpp bmp files to convert from rgb to ycc.\n");
	}

	free(rgb->data_array);
	free(rgb);
	free(bmp);

	return 0;
}

// Not optimized, uses floats
void convert_ycc_to_rgb(YCC_prime_t** ycc, rgb_array* rgb) {
		
		RGB_t** rgb_arr = mmalloc(sizeof(RGB_t*) * rgb->height);
		RGB_t* temp = mmalloc(sizeof(RGB_t));

		float y, cr, cb, r_f, g_f, b_f;
		int i, j;
		// for every row of pixels
		for (i = 0; i < rgb->height; i++) {
			// allocate a RGB object for each pixel
			rgb_arr[i] = mmalloc(rgb->width_px * sizeof(RGB_t));
			for (j = 0; j < rgb->width_px; j++) {
				y = ycc[i][j].y;
				cr = ycc[i][j].cr;
				cb = ycc[i][j].cb;
				r_f = 1.164 * (y - 16.0f) - 1.596 * (cr - 128.0f);
				g_f = 1.164 * (y - 16.0f) - 0.813 * (cr - 128.0f) - 0.391 * (cb - 128);
				b_f = 1.164 * (y - 16.0f) + 2.018 * (cb - 128.0f);
				//printf("%d %d r_f: %f g_f: %f b_f: %f\n", i, j, r_f, g_f, b_f);
				temp->red = (unsigned char) (r_f * RGB_NORMALIZE);
				temp->green = (unsigned char) (g_f * RGB_NORMALIZE);
				temp->blue = (unsigned char) (b_f * RGB_NORMALIZE);

				rgb_arr[i][j] = *temp;
				y = cb = cr = 0;
				r_f = g_f = b_f = 0;
				//printf("%d %d y: %d cb: %d cr: %d\n", i, j, rgb_arr[i][j].red, rgb_arr[i][j].green, rgb_arr[i][j].blue);
			}
		}

		rgb->data_array = rgb_arr;

		free(temp);
}