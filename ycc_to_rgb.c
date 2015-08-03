/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 */
 
 #include "image.h"

// Not optimized, uses floats
void convert_ycc_to_rgb(ycc_prime_array* ycc, rgb_array* rgb) {

	float y, cr, cb, r_f, g_f, b_f;
	int i, j;
	unsigned char r, g, b;

	// for every row of pixels
	for (i = 0; i < ycc->height; i++) {
		for (j = 0; j < ycc->width_px; j++) {
			
			y = ycc->data_array[i][j].y;
			cr = ycc->data_array[i][j].cr;
			cb = ycc->data_array[i][j].cb;
			r_f = 1.164 * (y - 16.0f) + 1.596 * (cr - 128.0f);
			g_f = 1.164 * (y - 16.0f) - 0.813 * (cr - 128.0f) - 0.391 * (cb - 128);
			b_f = 1.164 * (y - 16.0f) + 2.018 * (cb - 128.0f);

			r = (unsigned char) (r_f * RGB_NORMALIZE);
			g = (unsigned char) (g_f * RGB_NORMALIZE);
			b = (unsigned char) (b_f * RGB_NORMALIZE);

			// interpolate the pixel colours by duplication
			rgb->data_array[i*2][j*2].red = r;
			rgb->data_array[i*2][j*2].green = g;
			rgb->data_array[i*2][j*2].blue = b;

			rgb->data_array[i*2][(j*2)+1].red = r;
			rgb->data_array[i*2][(j*2)+1].green = g;
			rgb->data_array[i*2][(j*2)+1].blue = b;
			
			rgb->data_array[(i*2)+1][j*2].red = r;
			rgb->data_array[(i*2)+1][j*2].green = g;
			rgb->data_array[(i*2)+1][j*2].blue = b;
			
			rgb->data_array[(i*2)+1][(j*2)+1].red = r;
			rgb->data_array[(i*2)+1][(j*2)+1].green = g;
			rgb->data_array[(i*2)+1][(j*2)+1].blue = b;

			printf("%d %d r: %d g: %d b: %d\n", i, j, rgb->data_array[i][j].red, rgb->data_array[i][j].green, rgb->data_array[i][j].blue);

		}
	}
}