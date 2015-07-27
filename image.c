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
	int16_t file_type;
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
void read_bmp_info(FILE*, bmp_info*);
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
	//fread(bmp, sizeof(bmp_info), 1, file);
	read_bmp_info(file, bmp);

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

	
	printf("%s\n", rgb->data);
	printf("%d\n", rgb->width);
	printf("%d\n", rgb->height);
	printf("%d\n", rgb->bits_per_px);

	fclose(file);
}

void read_bmp_info(FILE* f, bmp_info* bmp) {
	// read the header
	fread(&bmp->file_type, sizeof(((bmp_info*)0)->file_type), 1, f);
	fread(&bmp->size_bytes, sizeof(((bmp_info*)0)->size_bytes), 1, f);
	fread(&bmp->reserved_1, sizeof(((bmp_info*)0)->reserved_1), 1, f);
	fread(&bmp->reserved_2, sizeof(((bmp_info*)0)->reserved_2), 1, f);
	fread(&bmp->offset, sizeof(((bmp_info*)0)->offset), 1, f);
	
	// info fields
	fread(&bmp->header_size, sizeof(((bmp_info*)0)->header_size), 1, f);
	fread(&bmp->width_px, sizeof(((bmp_info*)0)->width_px), 1, f);
	fread(&bmp->height_px, sizeof(((bmp_info*)0)->height_px), 1, f);
	fread(&bmp->num_colour_planes, sizeof(((bmp_info*)0)->num_colour_planes), 1, f);
	fread(&bmp->bits_per_px, sizeof(((bmp_info*)0)->bits_per_px), 1, f);
	fread(&bmp->compression, sizeof(((bmp_info*)0)->compression), 1, f);
	fread(&bmp->image_size, sizeof(((bmp_info*)0)->image_size), 1, f);
	fread(&bmp->h_resolution, sizeof(((bmp_info*)0)->h_resolution), 1, f);
	fread(&bmp->v_resolution, sizeof(((bmp_info*)0)->v_resolution), 1, f);
	fread(&bmp->num_colours, sizeof(((bmp_info*)0)->num_colours), 1, f);
	fread(&bmp->num_important_colours, sizeof(((bmp_info*)0)->num_important_colours), 1, f);

	/*
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
	int32_t num_important_colours;*/
}

void skip(FILE* f, int num_bytes) {
	int i;
	for (i = 0; i < num_bytes; i++) {
		fgetc(f);
	}
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

