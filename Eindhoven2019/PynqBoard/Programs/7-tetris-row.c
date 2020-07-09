#include <stdio.h>
#include "libpynq.h"
#define HEIGHT 12
#define WIDTH 12
int main (void) 
{
	pixel display[HEIGHT][WIDTH];
	init_display (HEIGHT, WIDTH,20,display);
	int y= 0,x = WIDTH/2,choice = 0,score = 0,timer = 0,i =0,j=0,count= 0;
 	int occupied[HEIGHT][WIDTH]; 
    int tempocc[HEIGHT][WIDTH];
    char option = 'y';
    while(option == 'y' || option == 'Y')
    {
    clear_display();
	for(i = 0;i<(WIDTH);i++)//Array initialisation
	{
		for(j = 0;j<HEIGHT;j++)
		{
			occupied[j][i] = 0;
		}
	}
	for(i = 0;i<(WIDTH);i++)
	{
		for(j = 0;j<HEIGHT;j++)
		{
			tempocc[j][i] = 0;
		}
	}
	//User inputs
	printf("Would you like an easy (3) or moderate (2) 0r hard (1) game ?\n");
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
        x = WIDTH/2;
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
                y = y+1;
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
                y = y+1;
				set_pixel(y,x,255,0,0);
				draw_display();	
				sleep_msec(timer);
			}
			else
			{
				set_pixel(y,x,0,0,0);
				draw_display();	
				y = y +1;
				set_pixel(y,x,255,0,0);
				draw_display();	
				sleep_msec(timer);
			}						
		}
		score = score + 1;
        set_pixel(y-1,x,255,0,0);
        draw_display();
		occupied[y-1][x] = 1;
        count = 0;
        for(i = 0;i< WIDTH;i++)
        {
            
            count = count+occupied[HEIGHT-1][i];
        }
        //clearing the last row
        if(count == WIDTH)
        {
            for(i = 0; i < WIDTH; i++)//copy to temp array
            {
                for(j = HEIGHT-1; j >0; j--)
                {
                    tempocc[j][i] = occupied[j-1][i];
                }
            } 
            for(i = 0; i < WIDTH;i++)//print new display
            {
                for(j = HEIGHT-1;j > 0; j--)
                {
                    if(tempocc[j][i] == 1)
                    {
                        set_pixel(j,i,255,0,0);
                    }
                    else if(tempocc[j][i] == 0)
                    {
                        
                        set_pixel(j,i,0,0,0);
                    }
                }
            }   
            draw_display();
            sleep_msec(timer);
            memcpy(occupied,tempocc,HEIGHT*WIDTH*sizeof(int));
        }
	}while(y>1);
	printf("Your score is:%d\n",score);
	score = 0;
    printf("Would you like to continue again?(y/n)\n");
    getc(stdin);
    scanf(" %c", &option);
    if(option == 'n' || option == 'N')
    {
        printf("Exiting in few seconds\nbye!\n");
        return 0;
    } 
    }
	sleep_msec(2000);
    return 0;
}




