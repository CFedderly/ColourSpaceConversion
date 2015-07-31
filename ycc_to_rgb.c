/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 */
 
 #include "image.h"
 
// Not optimized, uses floats
void convert_ycc_to_rgb(YCC_prime_t** ycc, rgb_array* rgb) {
		
		RGB_t** rgb_arr = mmalloc(sizeof(RGB_t*) * rgb->height);
		RGB_t* temp = mmalloc(sizeof(RGB_t));

		float y, cr, cb, r_f, g_f, b_f;
		int i, j;
		// for every row of pixels
		for (i = 0; i < rgb->height; i++) {
			// allocate a RGB object for each pixel
			rgb_arr[i] = mmalloc(rgb->width_px * sizeof(RGB_t));
			for (j = 0; j < rgb->width_px; j++) {
				y = ycc[i][j].y;
				cr = ycc[i][j].cr;
				cb = ycc[i][j].cb;
				r_f = 1.164 * (y - 16.0f) - 1.596 * (cr - 128.0f);
				g_f = 1.164 * (y - 16.0f) - 0.813 * (cr - 128.0f) - 0.391 * (cb - 128);
				b_f = 1.164 * (y - 16.0f) + 2.018 * (cb - 128.0f);
				//printf("%d %d r_f: %f g_f: %f b_f: %f\n", i, j, r_f, g_f, b_f);
				temp->red = (unsigned char) (r_f * RGB_NORMALIZE);
				temp->green = (unsigned char) (g_f * RGB_NORMALIZE);
				temp->blue = (unsigned char) (b_f * RGB_NORMALIZE);

				rgb_arr[i][j] = *temp;
				y = cb = cr = 0;
				r_f = g_f = b_f = 0;
				//printf("%d %d y: %d cb: %d cr: %d\n", i, j, rgb_arr[i][j].red, rgb_arr[i][j].green, rgb_arr[i][j].blue);
			}
		}

		rgb->data_array = rgb_arr;

		free(temp);
}