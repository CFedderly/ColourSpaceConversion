#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {

	if (argc != 4) {
		printf("Usage: ./csc <y> <cb> <cr>\n");
		printf("Assumes valid input.\n");
		exit(-1);
	}

	int y, cb, cr, r, g, b;

	y = atoi(argv[1]);
	cb = atoi(argv[2]);
	cr = atoi(argv[3]);

	r = g = b = -1;

	printf("YCC: %3d %3d %3d\n", y, cb, cr);
	printf("RGB: %3d %3d %3d\n", r, g, b);
	return 0;
}