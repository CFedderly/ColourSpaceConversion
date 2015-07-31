all:
	gcc -Wall -std=c99 -g colour_space_naive.c -o csc_naive
	gcc -Wall -std=c99 -g rgb_to_ycc_fp.c -lm -o rgb_to_ycc

csc_naive: colour_space_naive.c
	gcc -Wall -std=c99 -g colour_space_naive.c -o csc_naive

rgb_to_ycc: rgb_to_ycc_fp.c
	gcc -Wall -std=c99 -g rgb_to_ycc_fp.c -lm -o rgb_to_ycc

clean:
	rm csc_naive
	rm rgb_to_ycc