#include<stdio.h>
main(int argc, char **argv)
{
	printf("Enter a character");
		getchar();
			printf("%d\n",sum((atoi(argv[1])),(atoi(argv[2]))));
			}

			sum(int num1, int num2)
			{
				return num1 + num2;
				}
