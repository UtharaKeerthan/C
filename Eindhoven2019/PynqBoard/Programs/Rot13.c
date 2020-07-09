#include<stdio.h>
void main(void)
{
  char c;
  int Shift;
  const int NRLETTERS = 26;
  printf("Enter number of shift to be made:\n");
  scanf("%d", &Shift);
  if (Shift<0)
  {
	Shift = NRLETTERS + Shift%NRLETTERS;
  }
  while((c = getchar())!= '\n');
  printf("Enter the string:\n");
  {
  while ((c = getchar()) != '\n')
	{
		if (c >= 'a' && c <= 'z')
		putchar(('a' + (c-'a'+Shift)%NRLETTERS));
		else if (c >= 'A' && c <= 'Z')
		putchar(('A' + (c-'A'+Shift)%NRLETTERS));
		else
		putchar(c);
	}
 putchar(c);
 }
}  


