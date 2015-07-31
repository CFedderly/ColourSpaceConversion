#include "image.h"
#include "image.c"

int main(int argc, char* argv[]) {

	if (argc != 2) {
		printf("Usage: ./rgb_to_ycc <bmp_file_name>\n");
		exit(-1);
	}

	bmp_info* bmp = get_bmp_info(argv[1]);
	rgb_prime_array* rgb = get_pixel_array(bmp);

	if (rgb->bits_per_px == 24) {
		//allocate_ycc_array()
		//convert_ycc_to_rgb();
	} else {
		printf("Can only read 24bpp bmp files to convert from rgb to ycc.\n");
	}

	free_bmp_info(bmp);
	free_pixel_array(rgb);

	return 0;

}