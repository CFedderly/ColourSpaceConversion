/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 */

#include "image.h"

void convert_rgb_to_ycc(ycc_prime_array* ycc, rgb_prime_array* rgb) {

	// declare as a local constant -> won't ever change, don't need to do pointer chain every time.
	RGB_prime_t** rgb_arr = rgb->data_array; 

	// declare constants for all of the factors in the conversion
	// use factor of 2^13, constants are signed ints
	// these won't ever change, don't need to be computed dynamically
	const int32_t y_r = 2105;
	const int32_t y_g = 4128;
	const int32_t y_b = 802;
	const int32_t cb_r = -1212;
	const int32_t cb_g = -2383;
	const int32_t cb_b_cr_r = 3596;
	const int32_t cr_g = -3014;
	const int32_t cr_b = -581;

	// suggest to the compiler to keep these variables in registers 
	int32_t r, g, b;

	int32_t y, cb, cr;

	float division = (float) 1 / FP_DIVISOR;

	int i, j;

	// for every row of pixels
	for (i = 0; i < ycc->height; i++) {
		// for every pixel in the row
		// average the conversion between the pixels in a 2x2 square of pixels -> get 1 pixel
		// the ycc version of the bmp will have 1:4 pixels to the original bmp
		for (j = 0; j < ycc->width_px; j++) {

			y = cb = cr = 0;

			r = rgb_arr[(2*i)][(2*j)].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)][(2*j)].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)][(2*j)].blue * RGB_FP_FACTOR;
			y += ((y_r * r) + (y_g * g) + (y_b * b)) >> SHIFT_BITS;
			cb += ((cb_r * r) + (cb_g * g) + (cb_b_cr_r * b)) >> SHIFT_BITS;
			cr += ((cb_b_cr_r * r) + (cr_g * g) + (cr_b * b)) >> SHIFT_BITS;

			r = rgb_arr[(2*i)][(2*j)+1].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)][(2*j)+1].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)][(2*j)+1].blue * RGB_FP_FACTOR;
			y += ((y_r * r) + (y_g * g) + (y_b * b)) >> SHIFT_BITS;
			cb += ((cb_r * r) + (cb_g * g) + (cb_b_cr_r * b)) >> SHIFT_BITS;
			cr += ((cb_b_cr_r * r) + (cr_g * g) + (cr_b * b)) >> SHIFT_BITS;

			r = rgb_arr[(2*i)+1][(2*j)].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)+1][(2*j)].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)+1][(2*j)].blue * RGB_FP_FACTOR;
			y += ((y_r * r) + (y_g * g) + (y_b * b)) >> SHIFT_BITS;
			cb += ((cb_r * r) + (cb_g * g) + (cb_b_cr_r * b)) >> SHIFT_BITS;
			cr += ((cb_b_cr_r * r) + (cr_g * g) + (cr_b * b)) >> SHIFT_BITS;

			r = rgb_arr[(2*i)+1][(2*j)+1].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)+1][(2*j)+1].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)+1][(2*j)+1].blue * RGB_FP_FACTOR;
			y += ((y_r * r) + (y_g * g) + (y_b * b)) >> SHIFT_BITS;
			cb += ((cb_r * r) + (cb_g * g) + (cb_b_cr_r * b)) >> SHIFT_BITS;
			cr += ((cb_b_cr_r * r) + (cr_g * g) + (cr_b * b)) >> SHIFT_BITS;
			
			// use bit shift instead of division for averaging
			y = y / 4;
			cb = cb / 4;
			cr = cr / 4;

			ycc->data_array[i][j].y = y * division + 16.0f;
			ycc->data_array[i][j].cb = cb * division + 128.0f;
			ycc->data_array[i][j].cr = cr * division + 128.0f;
		
			//printf("%d %d y: %f cb: %f cr: %f\n", i, j, ycc->data_array[i][j].y, ycc->data_array[i][j].cb, ycc->data_array[i][j].cr);
		}
	}
}

ycc_prime_array* allocate_ycc_array(rgb_prime_array* rgb) {
	int i;

	ycc_prime_array* ycc = mmalloc(sizeof(ycc_prime_array));

	ycc->height = (rgb->height)/2;
	ycc->width_px = (rgb->width_px)/2;

	YCC_prime_t** array = mmalloc(sizeof(YCC_prime_t*) * ycc->height);
	for (i = 0; i < ycc->height; i++) {
		array[i] = mmalloc(sizeof(YCC_prime_t) * ycc->width_px);
	}

	ycc->data_array = array;

	return ycc;
}

void free_ycc_array(ycc_prime_array* ycc) {
	int i;

	for (i = 0; i < ycc->height; i++) {
		free(ycc->data_array[i]);
	}
	free(ycc->data_array);
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