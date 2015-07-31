make:
	gcc -Wall -std=c99 -g colour_space_conversion.c -lm -o csc

csc_naive: colour_space_naive.c
	gcc -Wall -std=c99 -g colour_space_naive.c -o csc_naive

clean:
	rm csc