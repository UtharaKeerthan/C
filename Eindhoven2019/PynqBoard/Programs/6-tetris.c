#include <stdio.h>
#include "libpynq.h"
#define HEIGHT 12
#define WIDTH 4
int main (void) 
{
	pixel display[HEIGHT][WIDTH];
	init_display (HEIGHT, WIDTH,20,display);
	int y= 0,x = WIDTH/2,choice = 0,score = 0,timer = 0,i =0,j=0,count= 0;
 	int occupied[HEIGHT][WIDTH/2]; 
	//Array initialisation	
	for(i = 0;i<(WIDTH/2);i++)
	{
		for(j = 0;j<HEIGHT;j++)
		{
			occupied[j][i] = 0;
		}
	}
	//User inputs
	printf("Would you like an easy (3) or moderate (2) 0r hard (1) game ?");
        scanf("%d", &choice);
	switch (choice)
	{
		case 1: 
			timer = 100;
			break;
		case 2: 
			timer = 300;
			break;
		case 3:
			timer = 500;
			break;
		default:
			timer = 500;
			break;
	}
	printf("Game starts in 1 second :\n)");
	sleep_msec(1000);
	do
	{
		y = 0;
		while(y< HEIGHT && !occupied[y][x])
		{
			sleep_msec_buttons_pushed (30);
			if (button_states[0] > 0)
			{			
				set_pixel(y,x,0,0,0);
				draw_display();	
                if(occupied[y][x+1] == 0)
                {    
                    x = x+1;
                }
                if(x > WIDTH-1)
                {
                    
                    x = WIDTH-1;
                }
				set_pixel(y,x,255,0,0);
				draw_display();	
				sleep_msec(timer);
			}
			else if(button_states[3] > 0)
			{
				set_pixel(y,x,0,0,0);
				draw_display();	
                if(occupied[y][x-1] == 0)
                {    
                    x = x-1;
                }
                if(x < 0)
                {
                    
                    x = 0;
                }
				set_pixel(y,x,255,0,0);
				draw_display();	
				sleep_msec(timer);
			}
				set_pixel(y,x,0,0,0);
				draw_display();	
				y = (y == 11)?y:y-1;
				draw_display();	
				sleep_msec(timer);
		}
		set_pixel(y-1,x,255,0,0);
		score = score + 1;
		occupied[y-1][x] = 1;
        printf("occupied is %d %d %d\n", occupied[y-1][x],y-1,x);   
	}while(y>1);
	printf("Your score is:%d\n",score);
	score = 0;
	printf("Exiting in few seconds\n");
	sleep_msec(2000);
}




