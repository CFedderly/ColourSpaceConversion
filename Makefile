all:
	gcc -Wall -Wextra -std=c99 -g colour_space_naive.c -o csc_naive
	gcc -Wall -Wextra -std=c99 -g ycc_to_rgb_fp.c -o ycc_to_rgb
	gcc -Wall -Wextra -std=c99 -g rgb_to_ycc_fp.c -o rgb_to_ycc

csc_naive: colour_space_naive.c
	gcc -Wall -Wextra -std=c99 -g colour_space_naive.c -o csc_naive

ycc_to_rgb: ycc_to_rgb_fp.c
	gcc -Wall -Wextra -std=c99 -g ycc_to_rgb_fp.c -o ycc_to_rgb

rgb_to_ycc: rgb_to_ycc_fp.c
	gcc -Wall -Wextra -std=c99 -g rgb_to_ycc_fp.c -o rgb_to_ycc

clean:
	rm csc_naive
	rm rgb_to_ycc
	rm ycc_to_rgb