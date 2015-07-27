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
	rgb_array* rgb = mmalloc(sizeof(rgb_array));

	get_bmp(argv[1], bmp, rgb);

	if (rgb->bits_per_px == 24) {
		
		YCC_t** ycc = mmalloc(sizeof(YCC_t*) * rgb->height);
		RGB_t** rgb_arr = rgb->data_array; 
		YCC_t* temp = mmalloc(sizeof(YCC_t));
		unsigned char r, g, b;
		int i, j;
		// for every row of pixels
		for (i = 0; i < rgb->height; i++) {
			// allocate a RGB object for each pixel
			ycc[i] = mmalloc(rgb->width * sizeof(YCC_t));
			for (j = 0; j < rgb->width; j++) {
				r = rgb_arr[i][j].red;
				g = rgb_arr[i][j].green;
				b = rgb_arr[i][j].blue;
				// naive
				temp->y = 16.0 + 0.257 * r + 0.504 * g + 0.098 * b;
				temp->cb = 128.0 - 0.148 * r - 0.291 * g + 0.439 * b;
				temp->cr = 128.0 + 0.439 * r - 0.368 * g - 0.071 * b; ;
				ycc[i][j] = *temp;
				printf("%d %d y: %f cb: %f cr: %f\n", i, j, ycc[i][j].y, ycc[i][j].cb, ycc[i][j].cr);
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