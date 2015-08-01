/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 */
 
 #include "image.h"

// Not optimized, uses floats
void convert_ycc_to_rgb(YCC_prime_t** ycc, rgb_array* rgb) {

	float y, cr, cb, r_f, g_f, b_f;
	int i, j;
	// for every row of pixels
	for (i = 0; i < rgb->height; i++) {
		for (j = 0; j < rgb->width_px; j++) {
			y = ycc[i][j].y;
			cr = ycc[i][j].cr;
			cb = ycc[i][j].cb;
			r_f = 1.164 * (y - 16.0f) - 1.596 * (cr - 128.0f);
			g_f = 1.164 * (y - 16.0f) - 0.813 * (cr - 128.0f) - 0.391 * (cb - 128);
			b_f = 1.164 * (y - 16.0f) + 2.018 * (cb - 128.0f);
			//printf("%d %d r_f: %f g_f: %f b_f: %f\n", i, j, r_f, g_f, b_f);
			rgb->data_array[i][j].red = (unsigned char) (r_f * RGB_NORMALIZE);
			rgb->data_array[i][j].green = (unsigned char) (g_f * RGB_NORMALIZE);
			rgb->data_array[i][j].blue = (unsigned char) (b_f * RGB_NORMALIZE);

			printf("%d %d r: %d g: %d b: %d\n", i, j, rgb->data_array[i][j].red, rgb->data_array[i][j].green, rgb->data_array[i][j].blue);

		}
	}
}