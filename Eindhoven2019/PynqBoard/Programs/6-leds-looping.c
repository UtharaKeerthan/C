#include<stdio.h>
#include<libpynq.h>
int main(void)
{
 int time;
 int nrleds = 4;
 printf("Wait for how many milliseconds?");
 scanf("%d",&time);
 if(time > 0)
 { 
        while(1)
        {       
                int LED;
                for(LED = 0; LED < nrleds; LED ++)
			{
				if(LED == 0)
				{
					led_onoff(LED,on);
					led_onoff(3,off);
					sleep_msec(time);
				}
				else
				{
					led_onoff(LED,on);
					led_onoff(LED-1,off);
					sleep_msec(time);				
				}
			}
        }
 }
 else
 {
 printf("The number of milliseconds should be at least 0");
 }
 return 0;
}


