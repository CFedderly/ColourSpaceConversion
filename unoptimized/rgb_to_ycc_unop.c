/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 */

#include "image.h"

void convert_rgb_to_ycc(ycc_prime_array* ycc, rgb_prime_array* rgb) {

	RGB_prime_t** rgb_arr = rgb->data_array; 

	int32_t r, g, b, y, cb, cr;
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
			y += 0.257 * r + 0.504 * g + 0.098 * b;
			cb += -0.148 * r - 0.291 * g + 0.439 * b;
			cr += 0.439 * r - 0.368 * g - 0.071 * b;

			r = rgb_arr[(2*i)][(2*j)+1].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)][(2*j)+1].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)][(2*j)+1].blue * RGB_FP_FACTOR;
			y += 0.257 * r + 0.504 * g + 0.098 * b;
			cb += -0.148 * r - 0.291 * g + 0.439 * b;
			cr += 0.439 * r - 0.368 * g - 0.071 * b;

			r = rgb_arr[(2*i)+1][(2*j)].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)+1][(2*j)].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)+1][(2*j)].blue * RGB_FP_FACTOR;
			y += 0.257 * r + 0.504 * g + 0.098 * b;
			cb += -0.148 * r - 0.291 * g + 0.439 * b;
			cr += 0.439 * r - 0.368 * g - 0.071 * b;

			r = rgb_arr[(2*i)+1][(2*j)+1].red * RGB_FP_FACTOR;
			g = rgb_arr[(2*i)+1][(2*j)+1].green * RGB_FP_FACTOR;
			b = rgb_arr[(2*i)+1][(2*j)+1].blue * RGB_FP_FACTOR;
			y += 0.257 * r + 0.504 * g + 0.098 * b;
			cb += -0.148 * r - 0.291 * g + 0.439 * b;
			cr += 0.439 * r - 0.368 * g - 0.071 * b;
			
			y = y / 4;
			cb = cb / 4;
			cr = cr / 4;

			ycc->data_array[i][j].y = y * division + 16.0f;
			ycc->data_array[i][j].cb = cb * division + 128.0f;
			ycc->data_array[i][j].cr = cr * division + 128.0f;
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