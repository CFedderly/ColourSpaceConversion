/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 */

#include <stdio.h>
#include <stdlib.h>
#include "image.c"

int main(int argc, char* argv[]) {

	/*
	if (argc != 4) {
		printf("Usage: ./csc <r> <g> <b>\n");
		printf("Assumes valid input.\n");
		exit(-1);
	}

	int r, g, b, y, cb, cr;

	r = atoi(argv[1]);
	g = atoi(argv[2]);
	b = atoi(argv[3]);

	y = cb = cr = -1;

	printf("RGB: %3d %3d %3d\n", r, g, b);
	printf("YCC: %3d %3d %3d\n", y, cb, cr);
	*/
	if (argc != 2) {
		printf("Usage: ./rgb_to_ycc <bmp_file_name>\n");
		exit(-1);
	}

	bmp_info* bmp = mmalloc(sizeof(bmp_info));
	rgb_array* rgb = mmalloc(sizeof(rgb_array));

	get_bmp(argv[1], bmp, rgb);

	if (rgb->bits_per_px == 24) {
		
	} else {
		printf("Can only read 24bpp bmp files to convert from rgb to ycc.\n");
	}

	free(rgb->data_array);
	free(rgb);
	free(bmp);

	return 0;
}