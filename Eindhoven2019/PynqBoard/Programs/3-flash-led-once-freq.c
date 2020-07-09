#include<stdio.h>
#include<libpynq.h>
int main(void)
{
 int time;
 printf("Wait for how many milliseconds?");
 scanf("%d",&time);
 if(time > 0)
 { 
     while(1)
     {
        led_onoff(0,on);
        sleep_msec(time);
        led_onoff(0,off);
        sleep_msec(time);
     }    
 }
 else
 {
 printf("The number of milliseconds should be at least 0");
 }
 return 0;
}


