#include <stdio.h>
#include "libpynq.h"
#define HEIGHT 12
#define WIDTH 24
int main (void) 
{
	pixel display[HEIGHT][WIDTH];
	init_display (HEIGHT, WIDTH,20,display);
	int y= 0,x = WIDTH/2;
		while(y< HEIGHT)
		{
			set_pixel(y,x,0,0,0);//set black
			y = y +1;
			set_pixel(y,x,255,0,0);//set red
			draw_display();	
			sleep_msec(200);			
		}

	sleep_msec(2000);
}



