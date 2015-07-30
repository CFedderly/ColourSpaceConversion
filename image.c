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

void get_bmp(char* filename, bmp_info* bmp, rgb_prime_array* rgb) {

	FILE* file;

	file = fopen(filename, "rb");

	if (file == NULL) {
		printf("Unable to open file: %s. Exiting.\n", filename);
		fclose(file);
		exit(-1);
	}

	// read the bitmap file info and header part
	read_bmp_info(file, bmp);

	size_t img_size = bmp->size_bytes;
	unsigned char* img_data = mmalloc(img_size);

	int file1 = open(filename, O_RDONLY);
	struct stat file_stat;
	fstat(file1, &file_stat);
	char* p = mmap(NULL, file_stat.st_size, PROT_READ, MAP_SHARED, file1, 0);
	memcpy(img_data, p + bmp->offset, (int) img_size);

	image_data_to_file(img_data, bmp);
	// width and height need to be a multiple of 4 bytes?
	// 24 bits- per pixel -> 3 bytes per pixel 
	// equation taken from https://en.wikipedia.org/wiki/BMP_file_format#Pixel_array_.28bitmap_data.29
	rgb->width_bytes = (int) floor( ((float) (bmp->width_px * bmp->bits_per_px) + 31)/ 32)*4;
	rgb->width_px = bmp->width_px;
	rgb->row_padding = bmp->width_px % 4;
	rgb->height = bmp->height_px;
	rgb->bits_per_px = bmp->bits_per_px;

	//get_pixel_array(img_data, rgb);
	get_pixel_prime_array(img_data, rgb);

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
}

void image_data_to_file(unsigned char* img_data, bmp_info* bmp) {
	FILE* write_file = fopen("test.txt", "wb");
	fwrite(img_data, bmp->size_bytes, 1, write_file);
	fclose(write_file);
}

void get_pixel_array(unsigned char* img_data, rgb_array* rgb) {
	int width_px = rgb->width_px;
	int height = rgb->height;
	int padding = rgb->row_padding;
	
	RGB_t** array = mmalloc(height * sizeof(RGB_t*));
	RGB_t* temp = mmalloc(sizeof(RGB_t));

	int i, j, k;
	// for every row of pixels
	for (i = 0; i < height; i++) {
		// allocate a RGB object for each pixel
		array[i] = mmalloc((width_px)* sizeof(RGB_t));
		for (j = 0; j < width_px; j++) {
			temp->blue = *img_data++;
			temp->green = *img_data++;
			temp->red = *img_data++;

			array[i][j] = *temp;
			//printf("%d %d r: %d g: %d b: %d\n", i, j, array[i][j].red, array[i][j].green, array[i][j].blue);
		}
		for (k = 0; k < padding; k++) {
			*img_data++;
		}
	}
	rgb->data_array = array;
	free(temp);
}

void get_pixel_prime_array(unsigned char* img_data, rgb_prime_array* rgb) {
	int width_px = rgb->width_px;
	int height = rgb->height;
	int padding = rgb->row_padding;

	RGB_prime_t** array = mmalloc(height * sizeof(RGB_prime_t*));
	RGB_prime_t* temp = mmalloc(sizeof(RGB_prime_t));

	int i, j, k;
	// for every row of pixels
	for (i = 0; i < height; i++) {
		// allocate a RGB object for each pixel
		array[i] = mmalloc(width_px * sizeof(RGB_prime_t));
		for (j = 0; j < width_px ; j++) {
			temp->blue = ((float) *img_data++) / RGB_NORMALIZE;
			temp->green = ((float) *img_data++) / RGB_NORMALIZE;			
			temp->red = ((float) *img_data++) / RGB_NORMALIZE;

			array[i][j] = *temp;
			printf("%d %d r: %f g: %f b: %f\n", i, j, array[i][j].red, array[i][j].green, array[i][j].blue);
		}
		for (k = 0; k < padding; k++) {
			*img_data++;
		}
	}
	rgb->data_array = array;
	free(temp);
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

