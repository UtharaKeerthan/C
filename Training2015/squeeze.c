#include<stdio.h>
#include<string.h>
void main()
{
	char str[10];
	int ctr,j;

	printf("Enter the string:");
	scanf("%s",str);

	for(ctr=0,j=0;ctr,j<strlen(str)-1;ctr++,j++)
	{
		if(str[ctr]!='c')
			str[j]=str[ctr];
		else
			str[j]='\0';
	}

	puts(str);
}	
