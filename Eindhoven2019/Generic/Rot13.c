#include<stdio.h>
#define NRLETTERS 26
void main()
{
int shift = 0;
char c;
printf("\n Enter the shift value:");
scanf("%d",&shift);
while(getchar()!= '\n');
if(shift<0)
{
	shift = NRLETTERS + (shift%NRLETTERS);
}
printf("\n Enter the string:");
while((c = getchar()) != '\n')
{
	if (c >= 'a' && c<= 'z' )
	{
	putchar('a'+(c-'a'+shift)%NRLETTERS);
	}
	else if (c >= 'A' && c <= 'Z')
	{
	putchar('A'+(c-'A'+shift)%NRLETTERS);
	}
	else
	{
	putchar(c);
	}
}
putchar(c);
}


