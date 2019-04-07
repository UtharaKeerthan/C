/*
	File Name:  startri2.c	
	Author   : Uthara Keerthan R
	Date     : 7/7/15
	Purpose  : To print an inverted triangle of stars(inverted pyramid) for user defined rows.
*/
#include<stdio.h>
void main()
{
	int cntrl,row_n,space,str1,str2;

	printf("Enter the number of rows to be printed:");
	scanf("%d",&row_n);

	for(cntrl=1;cntrl<=row_n;cntrl++)
	{

		for(space=1;space<=cntrl;space++)
		{
			printf(" ");
		}
		
		for(str1 = cntrl+1;str1<=row_n;str1++)
		{
			printf("*");
		}
		
		for(str2 = 1; str2<row_n-cntrl; str2++)
		{
		     printf("*");
		}	
		printf("\n");
	}
}	

