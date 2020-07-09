#include<stdio.h>
main()
{
	int iarr[]={1,2,3,4};
	int *iptr;
	iptr = malloc(4);
	*iptr=iarr[3];

	printf("%d",*iptr);
}	
