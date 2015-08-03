#include "image.h"
#include "image.c"
#include "rgb_to_ycc.c"
#include "ycc_to_rgb.c"

int main(int argc, char* argv[]) {

	if (argc != 2) {
		printf("Usage: ./rgb_to_ycc <bmp_file_name>\n");
		exit(-1);
	}

	bmp_info* bmp = get_bmp_info(argv[1]);
	rgb_prime_array* rgb = get_pixel_array(bmp);

	//Make sure that the bmp file is 24bpp
	if (rgb->bits_per_px == 24) {
		ycc_prime_array* ycc = allocate_ycc_array(rgb);
		convert_rgb_to_ycc(ycc, rgb);

		rgb_array* rgb_after = allocate_rgb_array(rgb->height, rgb->width_px, rgb->row_padding);
		convert_ycc_to_rgb(ycc, rgb_after);
		//write_to_bmp(bmp, rgb_after);e

		free_ycc_array(ycc);
		free_rgb_array(rgb_after);
	} else {
		printf("Can only read 24bpp bmp files to convert from rgb to ycc.\n");
	}

	free_bmp_info(bmp);
	free_pixel_array(rgb);

	return 0;

}
