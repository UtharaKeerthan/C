#include <stdio.h>
#include "libpynq.h"
#define HEIGHT 12
#define WIDTH 12
int main (void) 
{
	pixel display[HEIGHT][WIDTH];
	init_display (HEIGHT, WIDTH,20,display);
	int y= 0,x = 0;
 	int occupied[HEIGHT][WIDTH/2]; 
	//Array initialisation
	for(x = 0;x<(WIDTH/2);x++)
	{
		for(y = 0;y<HEIGHT;y++)
		{
			occupied[y][x] = 0;
		}
	}
	y = 0;
	x = WIDTH/2;
	do
	{
		y = 0;
		x = WIDTH/2;
		while(y< HEIGHT-1 && !occupied[y][x])
		{
			set_pixel(y,x,0,0,0);//set black
			y = y +1;
			set_pixel(y,x,255,0,0);//set red
			draw_display();	
			sleep_msec(100);			
		}
		occupied[y-1][x] = 1;
	}while(y>1);

	sleep_msec(2000);
}
