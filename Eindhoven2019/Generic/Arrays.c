#include<stdio.h>
#include<math.h>
void swap1(int *x, int*y)
{
	int temp;
	temp = *x;
	*x = *y;
	*y = temp;
}
void mysort(int a[])
{
	int i,j;
	for(i = 0;i < 5;i++)
	{
		for(j= 0; j < 5; j++)
		{
			if(a[j] < a[i])
			{
		 	swap1(&a[i],&a[j]);
			}
		}
	}
	printf("\n The descending order sorted array is:");

	for(i = 0; i < 5;i++)
	{
	printf("\n %d",a[i]);
	}
}
float avgcalc(int a[],int y)
{
	int i,sum = 0;
	float avg;
	for(i = 0; i < y;i++)
	{
		sum = sum + a[i];
		printf("\n the sum value is %d",sum);
	}
	avg = floor(sum/5);
	return avg;
}
void main()
{
int a[5];
int sum = 0,i;
float avg;
for(i = 0; i < 5;i++)
{
	printf("Enter the %dth number of the array:",i);
	scanf("%d",&a[i]);
}
avg = avgcalc(a,5);

printf("\n The average of the number array is:%f",avg);

mysort(a);
}


