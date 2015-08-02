/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 */

#include "image.h"

void convert_rgb_to_ycc(YCC_prime_t** ycc, rgb_prime_array* rgb) {

	RGB_prime_t** rgb_arr = rgb->data_array; 

	int32_t r, g, b, y, cb, cr;
	float division = (float) 1 / FP_DIVISOR;

	int i, j;
	// for every row of pixels
	for (i = 0; i < rgb->height; i++) {

		for (j = 0; j < rgb->width_px; j++) {

			r = rgb_arr[i][j].red * RGB_FP_FACTOR;
			g = rgb_arr[i][j].green * RGB_FP_FACTOR;
			b = rgb_arr[i][j].blue * RGB_FP_FACTOR;
			y = ((int) (0.257 * CONSTANT_FP_FACTOR) * r + (int) (0.504 * CONSTANT_FP_FACTOR) * g + (int) (0.098 * CONSTANT_FP_FACTOR) * b) >> SHIFT_BITS;
			cb = ((int)(-0.148 * CONSTANT_FP_FACTOR) * r - (int) (0.291 * CONSTANT_FP_FACTOR) * g + (int) (0.439 * CONSTANT_FP_FACTOR) * b) >> SHIFT_BITS;
			cr = ((int) (0.439 * CONSTANT_FP_FACTOR) * r - (int) (0.368 * CONSTANT_FP_FACTOR) * g - (int) (0.071 * CONSTANT_FP_FACTOR) * b) >> SHIFT_BITS;
			//printf("%d %d y: %d cb: %d cr: %d\n", i, j, y, cb, cr);

			//printf("divisor: %f\n", division);
			ycc[i][j].y = y * division + 16.0f;
			ycc[i][j].cb = cb * division + 128.0f;
			ycc[i][j].cr = cr * division + 128.0f;

			printf("%d %d y: %f cb: %f cr: %f\n", i, j, ycc[i][j].y, ycc[i][j].cb, ycc[i][j].cr);
		}
	}
}

YCC_prime_t** allocate_ycc_array(int height, int width) {
	int i;

	YCC_prime_t** ycc = mmalloc(sizeof(YCC_prime_t*) * height);
	for (i = 0; i < height; i++) {
		ycc[i] = mmalloc(sizeof(YCC_prime_t) * width);
	}

	return ycc;
}

void free_ycc_array(YCC_prime_t** ycc, int height) {
	int i;

	for (i = 0; i < height; i++) {
		free(ycc[i]);
	}
	free(ycc);
}

rgb_array* allocate_rgb_array(int height, int width, int row_padding) {
	int i;

	rgb_array* rgb = mmalloc(sizeof(rgb_array));
	rgb->height = height;
	rgb->width_px = width;
	rgb->row_padding = row_padding;

	RGB_t** array = mmalloc(sizeof(RGB_t*) * height);
	for (i = 0; i < height; i++) {
		array[i] = mmalloc(sizeof(RGB_t) * width);
	}

	rgb->data_array = array;

	return rgb;
}

void free_rgb_array(rgb_array* rgb) {
	int i;

	for (i = 0; i < rgb->height; i++) {
		free(rgb->data_array[i]);
	}
	free(rgb->data_array);
	free(rgb);
}