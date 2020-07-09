/*
	File Name: startri3.c
	Author   : Uthara Keerthan R
	Date     : 7/7/15	
	Purpose  : To print a pyramid of spaces surrounded by stars for user defined rows.
*/
#include<stdio.h>
void main()
{
	int row_n,cntrl,str1,str2,space;
	
	printf("Enter the number of rows to be printed:");
	scanf("%d",&row_n);
     
	for(cntrl=1;cntrl<=row_n;cntrl++)
	{
		
		for(str1 =1;str1<= row_n-cntrl+1;str1++)
		{
			printf("*");
		}
		
		for(space=1;space<=2*(cntrl-1);space++)
		{
			printf(" ");

		}
		for(str2=1;str2<=row_n-cntrl+1;str2++)
		{
			printf("*");
		}	

		printf("\n");
	}
}	
