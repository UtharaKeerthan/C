#include<stdio.h>
#include<libpynq.h>
int main(void)
{
 int waited = 0;
 printf("Please press button 0\n");
 while(1)
 {
	wait_until_button_pushed(0);
	led_onoff(0,on);	
	waited = wait_until_button_released(0);	
	led_onoff(0,off);
	printf("button 0 was pressed for %d milliseconds,\n", waited);					

 }
 return 0;
}


