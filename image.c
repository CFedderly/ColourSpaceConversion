/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 *
 * Referenced David Brackeen's C-code for Bitmap and Palette
 * Manipulation - http://www.brackeen.com/vga/bitmaps.html
 */

 #include "image.h"
 #include <math.h>

bmp_info* get_bmp_info(char* filename) {
	
	FILE* file;

	file = fopen(filename, "rb");

	if (file == NULL) {
		printf("Unable to open file: %s. Exiting.\n", filename);
		fclose(file);
		exit(-1);
	}

	bmp_info* bmp = mmalloc(sizeof(bmp_info));

	// read the bitmap file info and header part
	read_bmp_info(file, bmp);

	size_t img_size = bmp->size_bytes;
	unsigned char* img_data = mmalloc(img_size);

	// open file as an int, memcpy the image data containing pixel data
	int file1 = open(filename, O_RDONLY);
	struct stat file_stat;
	fstat(file1, &file_stat);
	char* p = mmap(NULL, file_stat.st_size, PROT_READ, MAP_SHARED, file1, 0);
	memcpy(img_data, p + bmp->offset, (int) img_size);

	bmp->image_data = img_data;

	close(file1);
	fclose(file);

	return bmp;
}

void free_bmp_info(bmp_info* bmp) {
	free(bmp->image_data);
	free(bmp);
}

rgb_prime_array* get_pixel_array(bmp_info* bmp) {

	rgb_prime_array* rgb = mmalloc(sizeof(rgb_prime_array));

	rgb->width_px = bmp->width_px;
	rgb->row_padding = bmp->width_px % 4;
	rgb->height = bmp->height_px;
	rgb->bits_per_px = bmp->bits_per_px;

	get_rgb_pixel_array(bmp->image_data, rgb);

	return rgb;
}

void free_pixel_array(rgb_prime_array* rgb) {
	int i;
	for (i = 0; i < rgb->height; i++) {
		free(rgb->data_array[i]);
	}
	free(rgb->data_array);
	free(rgb);
}

void write_to_bmp(bmp_info* bmp, rgb_array* rgb) {

	FILE* file;
	file = fopen("converted.bmp", "wb");

	write_bmp_info(file, bmp);

	write_pixel_array(file, rgb);
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

static void read_bmp_info(FILE* f, bmp_info* bmp) {
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
}

static void write_bmp_info(FILE* f, bmp_info* bmp) {
	// read the header
	fwrite(&bmp->file_type, sizeof(((bmp_info*)0)->file_type), 1, f);
	fwrite(&bmp->size_bytes, sizeof(((bmp_info*)0)->size_bytes), 1, f);
	fwrite(&bmp->reserved_1, sizeof(((bmp_info*)0)->reserved_1), 1, f);
	fwrite(&bmp->reserved_2, sizeof(((bmp_info*)0)->reserved_2), 1, f);
	fwrite(&bmp->offset, sizeof(((bmp_info*)0)->offset), 1, f);
	
	// info fields
	fwrite(&bmp->header_size, sizeof(((bmp_info*)0)->header_size), 1, f);
	fwrite(&bmp->width_px, sizeof(((bmp_info*)0)->width_px), 1, f);
	fwrite(&bmp->height_px, sizeof(((bmp_info*)0)->height_px), 1, f);
	fwrite(&bmp->num_colour_planes, sizeof(((bmp_info*)0)->num_colour_planes), 1, f);
	fwrite(&bmp->bits_per_px, sizeof(((bmp_info*)0)->bits_per_px), 1, f);
	fwrite(&bmp->compression, sizeof(((bmp_info*)0)->compression), 1, f);
	fwrite(&bmp->image_size, sizeof(((bmp_info*)0)->image_size), 1, f);
	fwrite(&bmp->h_resolution, sizeof(((bmp_info*)0)->h_resolution), 1, f);
	fwrite(&bmp->v_resolution, sizeof(((bmp_info*)0)->v_resolution), 1, f);
	fwrite(&bmp->num_colours, sizeof(((bmp_info*)0)->num_colours), 1, f);
	fwrite(&bmp->num_important_colours, sizeof(((bmp_info*)0)->num_important_colours), 1, f);
}

static void write_pixel_array(FILE* f, rgb_array* rgb) {

	int i, j, k;
	
	char pad = '0';

	for (i = 0; i < rgb->height; i++) {
		for (j = 0; j < rgb->width_px ; j++) {
			fwrite(&rgb->data_array[i][j].blue, sizeof(char), 1, f);
			fwrite(&rgb->data_array[i][j].green, sizeof(char), 1, f);
			fwrite(&rgb->data_array[i][j].red, sizeof(char), 1, f);
		}
		for (k = 0; k < rgb->row_padding; k++) {
			fwrite(&pad, 1, sizeof(char), f);
		}
	}
}

static void get_rgb_pixel_array(unsigned char* img_data, rgb_prime_array* rgb) {
	int width, height, width_odd, height_odd;
	int padding = rgb->row_padding;

	// check to see that both the row and the column have an even number of pixels
	// if not, need to replicate the last row or column
	// this is necessary for downsampling
	height_odd = width_odd = 0;
	if (rgb->height & 0x01) {
		height = rgb->height + 1;
		height_odd = 1;
	} else {
		height = rgb->height;
	}

	if (rgb->width_px & 0x01) {
		width = rgb->width_px + 1;
		width_odd = 1;
	} else {
		width = rgb->width_px;
	}

	RGB_prime_t** array = mmalloc(height * sizeof(RGB_prime_t*));
	RGB_prime_t* temp = mmalloc(sizeof(RGB_prime_t));

	int i, j, k;
	// for every row of pixels
	for (i = 0; i < rgb->height; i++) {
		// allocate a RGB object for each pixel
		array[i] = mmalloc(width * sizeof(RGB_prime_t));
		for (j = 0; j < rgb->width_px ; j++) {
			temp->blue = ((float) *img_data++) / RGB_NORMALIZE;
			temp->green = ((float) *img_data++) / RGB_NORMALIZE;			
			temp->red = ((float) *img_data++) / RGB_NORMALIZE;

			array[i][j] = *temp;
			//printf("%d %d r: %f g: %f b: %f\n", i, j, array[i][j].red, array[i][j].green, array[i][j].blue);
		}
		for (k = 0; k < padding; k++) {
			*img_data++;
		}
	}

	if (height_odd) {
		for (i = 0; i < rgb->width_px; i++) {
			array[height - 1][i] = array[height - 2][i];
		}
		rgb->height = height;
	}

	if (width_odd) {
		for (j = 0; j < height; j++) {
			array[j][width - 1] = array[j][width - 2];
		}
		rgb->width_px = width;
		rgb->row_padding = width % 4;
	}

	rgb->data_array = array;
	free(temp);
}
