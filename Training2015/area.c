#include<stdio.h>
#define PI 3.1415
void main()
{
	float area;
	float radius=2.0;
	float area_of_circle(float);

	area=area_of_circle(radius);
	printf("The area of the circle is %f",area);
}
float area_of_circle(float r)
{
	 float a;
	 a=PI*r*r;
	 return a;
}

