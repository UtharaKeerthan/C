#include<stdio.h>
#include<libpynq.h>
int main(void)
{
 int button0;
 while(1)
 {
 	button0 =  button_state(0);
 		if (button0 == 1)
 		{
			printf("button 0 is pushed");
		}
		else
		{
			printf("button 0 is released");
		}
 }
 return 0;
}


