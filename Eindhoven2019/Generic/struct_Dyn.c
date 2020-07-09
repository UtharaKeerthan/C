#include<stdio.h>
#include<stdlib.h>
#include<math.h>
struct cart_coord
{

	int x;
	int y;
};
struct polar_coord
{
	int a;
	int b;
};

void main()
{
	struct cart_coord cc1 = {5,5};
	struct polar_coord* pc1;
	//int x,y;
	
	//printf("\nEnter the two co ordinates for the cartesion system:");
	//scanf("%d %d", &x, &y);

	//cc1.x = x;
	//cc1.y = y;

	//Dynamic memory allocation for the structure element that has been created.
	pc1 = (struct polar_coord*) malloc(sizeof(struct polar_coord));
	pc1->a = cc1.x + cc1.y;
	pc1->b = cc1.x - cc1.y;
	
	printf("\n The result values are %d %d", pc1->a,pc1->b);
	
	free(pc1);

}



