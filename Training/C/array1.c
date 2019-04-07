#include<stdio.h>
void main()
{
	int ctr;
	int aidata[5];

	for(ctr=0;ctr<5;ctr++)
	{
		printf("Enter the %d element value:",ctr);
		scanf("%d",&aidata[ctr]);
	}

	for(ctr=0;ctr<5;ctr++)
	{
		printf("The %d element is %d '\n'",ctr,aidata[ctr]);
	}
}	
