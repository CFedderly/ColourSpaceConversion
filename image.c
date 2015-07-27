/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 *
 * Referenced David Brackeen's C-code for Bitmap and Palette
 * Manipulation - http://www.brackeen.com/vga/bitmaps.html
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// As defined at https://en.wikipedia.org/wiki/BMP_file_format
typedef struct bmp_info {

// header fields
	char file_type[2];
	int32_t size_bytes;
	int16_t reserved_1;
	int16_t reserved_2;
	int32_t offset; // starting address of image data

// info fields
	int32_t header_size;
	int32_t width_px;
	int32_t height_px;
	int16_t num_colour_planes;
	int16_t bits_per_px;
	int32_t compression;
	int32_t image_size;
	int32_t h_resolution;
	int32_t v_resolution;
	int32_t num_colours;
	int32_t num_important_colours;

} bmp_info;

typedef struct rgb_array {
	int32_t width;
	int32_t height;
	int16_t bits_per_px;
	char* data;
} rgb_array;

void get_bmp(char*, bmp_info*, rgb_array*);
void* mmalloc(size_t);

void get_bmp(char* filename, bmp_info* bmp, rgb_array* rgb) {

	FILE* file;

	file = fopen(filename, "rb");

	if (file == NULL) {
		printf("Unable to open file: %s. Exiting.\n", filename);
		fclose(file);
		exit(-1);
	}

	// read the bitmap file info and header part
	fread(bmp, 54, 1, file);
	printf("%lu\n", sizeof(bmp_info));
	printf("%d\n", bmp->offset);
	printf("%d\n", bmp->image_size);
	// use offset value from header to go to bitmap data
	fseek(file, bmp->offset, SEEK_SET);

	size_t img_size = bmp->image_size;
	char* img_data = mmalloc(img_size);

	fread(img_data, img_size, 1, file);

	rgb->data = img_data;
	rgb->width = bmp->width_px;
	rgb->height = bmp->height_px;
	rgb->bits_per_px = bmp->bits_per_px;

	/*
	printf("%s\n", rgb->data);
	printf("%d\n", rgb->width);
	printf("%d\n", rgb->height);
	printf("%d\n", rgb->bits_per_px);*/

	fclose(file);
}

// Wrapper function for malloc
void* mmalloc(size_t size) {

  void* allocated = malloc(size);
  if (allocated == NULL) {
    printf("Error allocating memory. Exiting.\n");
    exit(-1);
  }
  return allocated;
}

