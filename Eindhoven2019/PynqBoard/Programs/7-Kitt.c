#include<stdio.h>
#include<libpynq.h>
int main(void)
{
 int time;
 int nrleds = 4;
 int count = 0;
 int LED;
 printf("Wait for how many milliseconds?");
 scanf("%d",&time);
 if(time > 0)
 { 
        while(count<20)
        {       
                for(LED = 1; LED < 2*nrleds-1; LED++)
			{
				if(LED -1 == 0)
				{ 	

					led_onoff(LED-1,on);
					led_onoff(LED,off);
					sleep_msec(time);
				}
				else if(LED <= nrleds)
				{
					led_onoff(LED-1,on);
					led_onoff(LED-2,off);
					sleep_msec(time);				
				}
				else
				{
					led_onoff(2*nrleds-LED-1,on);
					led_onoff(2*nrleds-LED,off);
					sleep_msec(time);
				}
			}
		count = count+1;
        }

        for(LED = 0; LED < nrleds; LED++)
        {
		led_onoff(LED,off);
	}
 }
 else
 {
 printf("The number of milliseconds should be at least 0");
 }
 return 0;
}


