/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 */

#include "image.h"

void convert_rgb_to_ycc(YCC_prime_t** ycc, rgb_prime_array* rgb) {

		YCC_prime_t** ycc = mmalloc(sizeof(YCC_prime_t*) * rgb->height);
		RGB_prime_t** rgb_arr = rgb->data_array; 
		YCC_prime_t* temp = mmalloc(sizeof(YCC_prime_t));

		int32_t r, g, b, y, cb, cr;
		float division = (float) 1 / FP_DIVISOR;
		int i, j;
		// for every row of pixels
		for (i = 0; i < rgb->height; i++) {
			// allocate a RGB object for each pixel
			ycc[i] = mmalloc(rgb->width_px * sizeof(YCC_prime_t));
			for (j = 0; j < rgb->width_px; j++) {
				r = rgb_arr[i][j].red * RGB_FP_FACTOR;
				g = rgb_arr[i][j].green * RGB_FP_FACTOR;
				b = rgb_arr[i][j].blue * RGB_FP_FACTOR;
				//printf("r: %d g: %d b: %d\n", r, g, b);
				y = ((int) (0.257 * CONSTANT_FP_FACTOR) * r + (int) (0.504 * CONSTANT_FP_FACTOR) * g + (int) (0.098 * CONSTANT_FP_FACTOR) * b) >> SHIFT_BITS;
				cb = ((int)(-0.148 * CONSTANT_FP_FACTOR) * r - (int) (0.291 * CONSTANT_FP_FACTOR) * g + (int) (0.439 * CONSTANT_FP_FACTOR) * b) >> SHIFT_BITS;
				cr = ((int) (0.439 * CONSTANT_FP_FACTOR) * r - (int) (0.368 * CONSTANT_FP_FACTOR) * g - (int) (0.071 * CONSTANT_FP_FACTOR) * b) >> SHIFT_BITS;
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
}

YCC_prime_t** allocate_ycc_array(int height, int width) {
	int i;

	YCC_prime_t** ycc = mmalloc(sizeof(YCC_prime_t*) * height);
	for (i = 0; i < width; i++) {
		ycc[i] = mmalloc(sizeof(YCC_prime_t)*width);
	}

	return ycc;
}