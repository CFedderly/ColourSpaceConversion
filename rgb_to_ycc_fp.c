#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {

	if (argc != 4) {
		printf("Usage: ./csc <r> <g> <b>\n");
		printf("Assumes valid input.\n");
		exit(-1);
	}

	int r, g, b, y, cb, cr;

	r = atoi(argv[1]);
	g = atoi(argv[2]);
	b = atoi(argv[3]);

	y = cb = cr = -1;

	printf("RGB: %3d %3d %3d\n", r, g, b);
	printf("YCC: %3d %3d %3d\n", y, cb, cr);

	return 0;
}