/*
	File name: startri.c			
	Author   : Uthara Keerthan R
	Date     : 7/7/15
	purpose  : To print a triangle of stars(pyramid) for user defined rows.
*/
#include<stdio.h>
void main()
{
	int cntrl,space,str1,str2,row_n;
	printf("Enter the number of rows:");
	scanf("%d",&row_n);
	for(cntrl=1;cntrl<row_n;cntrl++)
	{
		for(space=1;space<=row_n-cntrl;space++)
		{
			printf(" ");
		
		}

		for(str1=5;str1>=row_n-cntrl+1;str1--)
		{
			printf("*");
		}
		
		for(str2=cntrl-1;str2>=1;str2--)
		{
			printf("*");
		}
		printf("\n");

	}
}	

