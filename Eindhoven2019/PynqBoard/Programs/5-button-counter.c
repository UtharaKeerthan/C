#include<stdio.h>
#include<libpynq.h>
#include<string.h>
int main(void)
{
 char c3,c2,c1,c0;
 int  digit = 0,d3=0,d2 =0,d1= 0,d0 = 0;
 printf("\nplease enter a binary number of 4 digits?");
 scanf(" %c%c%c%c",&c3,&c2,&c1,&c0);

 if ((c3 != '0' && c3 != '1')||(c2 != '0' && c2 != '1')||(c1!= '0' && c1 != '1')||(c0 != '0' && c0 != '1'))
 {
	printf("binary digits must be 0 or 1\n");
 }
 else
 {
	d3 = (c3 == '0'?0:1);
 	d2 = (c2 == '0'?0:1);
 	d1 = (c1 == '0'?0:1);
 	d0 = (c0 == '0'?0:1);
	digit = d3*8+d2*4+d1*2+d0*1;
	printf("The decimal value of the binary number %d%d%d%d is %d \n", d3,d2,d1,d0,digit);
 	while(1)
 	{
		if (d3 == 1)
		{
			led_onoff(3,on);
		}
		else
		{
			led_onoff(3,off);	
		}
		if (d2 == 1)
		{
			led_onoff(2,on);
		}
		else
		{
			led_onoff(2,off);	
		}
		if (d1 == 1)
		{
			led_onoff(1,on);
		}
		else
		{
			led_onoff(1,off);	
		}
		if (d0 == 1)
		{
			led_onoff(0,on);
		}
		else
		{
			led_onoff(0,off);	
		}
		wait_until_button_pushed (0);
		wait_until_button_released (0);
					
		if(d0 == 0)
		{
			d0 = 1;
		}
		else
		{
			d0 = 0;				
			if(d1 == 0)
			{
				d1 = 1;
			}
			else
			{
				d1 = 0;
				if(d2 == 0)
				{
					d2 = 1;
				}
				else
				{
					d2 = 0;
					if(d3 == 0)
					{
						d3 = 1;
					}
					else
					{
						d3 = 0;
						d2 = 0;
						d1 = 0;
						d0 = 0;				
						printf("Overflow\n");							
					}
				}											
			}	
		}
		digit = d3*8+d2*4+d1*2+d0*1;
		printf("The decimal value of the binary number %d%d%d%d is %d\n", d3,d2,d1,d0,digit);
	}
 } 
 return 0;
}


