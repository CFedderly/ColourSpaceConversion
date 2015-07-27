/* Charlotte Fedderly
 * Evan Murphy
 * SENG 440 Summer 2015
 * Colour Space Conversion Project
 * Naive colour space conversion: RGB to YCC and YCC to RGB
 * Usage: ./csc <input type> <c1> <c2> <c3>
 * where input type is either rgb or ycc
 * Assumes valid input.
 */ 

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// http://www.codeproject.com/Articles/58289/C-Round-Function
#define round(a) (a >= 0) ? (int)(a + 0.5) : (int)(a - 0.5);

int round_val(float num, int type) {
	// type: 0 = rgb, 
	//       1 = ycc_y,
	//       2 = ycc_r
	int rounded, min, max;

	if (type == 0) {
		min = 0;
		max = 255;
	} else if (type == 1) {
		min = 16;
		max = 235;
	} else if (type == 2) {
		min = 16;
		max = 240;
	} else {
		min = max = 0;
	}

	rounded = (int) round(num);

	if (rounded < min) {
		rounded = min;
	} else if (rounded > max) {
		rounded = max;
	}

	return rounded;
}

void ycc_to_rgb(int y, int cb, int cr) {
	float r_f, g_f, b_f;
	int r, g, b;

	// conversion as provided in class slides 
	r_f = 1.164 * (y - 16) - 1.596 * (cr - 128);
	g_f = 1.164 * (y - 16) - 0.813 * (cr - 128) - 0.391 * (cb - 128);
	b_f = 1.164 * (y - 16) + 2.018 * (cb - 128); 

	r = round_val(r_f, 0);
	g = round_val(g_f, 0);
	b = round_val(b_f, 0);

	printf("YCC: %3d %3d %3d\n", y, cb, cr);
	printf("RGB: %3d %3d %3d\n", r, g, b);
}

void rgb_to_ycc(int r, int g, int b) {
	float y_f, cb_f, cr_f;
	int y, cb, cr;

	// conversion as provided in class slides 
	y_f = 16.0 + 0.257 * r + 0.504 * g + 0.098 * b;
	cb_f = 128.0 - 0.148 * r - 0.291 * g + 0.439 * b;
	cr_f = 128.0 + 0.439 * r - 0.368 * g - 0.071 * b; 

	y = round_val(y_f, 1);
	cb = round_val(cb_f, 2);
	cr = round_val(cr_f, 2);

	printf("RGB: %3d %3d %3d\n", r, g, b);
	printf("YCC: %3d %3d %3d\n", y, cb, cr);
}


int main(int argc, char* argv[]) {

	if (argc != 5) {
		printf("Usage: ./csc <input type> <c1> <c2> <c3>\n");
		printf("Input types: ycc or rgb\n");
		printf("Assumes correct input.\n");
		exit(-1);
	}

	int c1, c2, c3;
	c1 = atoi(argv[2]);
	c2 = atoi(argv[3]);
	c3 = atoi(argv[4]);

	if (strcmp(argv[1], "ycc") == 0) {
		ycc_to_rgb(c1, c2, c3);
	} else if (strcmp(argv[1], "rgb") == 0) {
		rgb_to_ycc(c1, c2, c3);
	} else {
		printf("Invalid input type. Must be ycc or rgb.\n");
	}
	return 0;
}