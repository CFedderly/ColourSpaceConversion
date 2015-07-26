#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {

	if (argc != 4) {
		printf("Usage: ./csc <y> <cb> <cr>\n");
		printf("Assumes valid input.\n");
		exit(-1);
	}

	int y, cb, cr;
	y = atoi(argv[1]);
	cb = atoi(argv[2]);
	cr = atoi(argv[3]);

	return 0;
}