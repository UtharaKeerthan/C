#include<stdio.h>
main()
{
	char q[2][12];

	scanf("%s %s",q[0],q[1]);

	printf("%s",q+1);
	printf("%s",*q+0);
}	
