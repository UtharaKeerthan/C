#include<stdio.h>
#include<libpynq.h>
int main(void)
{
 int waited=0;
 while(1)
 {
	wait_until_button_released(0);
	printf("\n Wait until the button is pushed");
	waited = wait_until_button_pushed(0);
	printf("\n The wait time is %d milliseconds",waited);
 }
 return 0;
}


