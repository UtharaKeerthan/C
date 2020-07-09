#include<stdio.h>
float max2(float a,float b)
{
    float max = a;
    if (a<b)
        max = b;
    return max;
}
float max3(float a, float b, float c)
{
    float max;
    max = max2(max2(a,b),c);
    return max;
}
void main()
{
    float x,y,z,max;
    printf("\n Enter the value of x,y,z:");
    scanf("%f %f %f", &x,&y,&z);
    max = max3(x,y,z);
    printf("\n The maximum of all the 3 variables is %f",max);
}


