csc: colour_space_naive.c
	gcc -Wall -Wextra -std=c99 -g colour_space_naive.c -o csc

clean:
	rm csc