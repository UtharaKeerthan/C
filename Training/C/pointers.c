#include<stdio.h>
main()
{
	int arr[4]={20,30,40,50};
	int *ptr=arr;

		
	printf("%p  %d\n",(ptr+0),*(ptr+0));
	printf("%p  %d\n",(ptr+1),*(ptr+1));

	printf("%p  %d\n",(arr+0),*(arr+0));
}	
