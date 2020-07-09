#include<stdio.h>
#include<stdlib.h>
#include<math.h>
typedef struct node
{

	int data;
	struct node *next;
}node_t;

void printnode(node_t *n1)
{
	node_t *curr = n1;
	while(curr != NULL)
	{
		printf("\n %d", curr->data);
		curr = curr->next;
	}
	
}



void main()
{
	node_t n1,n2,n3;
	n1.data = 10;
	n2.data = 12;
	n3.data = 14;
	n1.next = &n2;
	n2.next = &n3;
	n3.next = NULL;
	
	printnode(&n1);

	insertnode(&n1);
}



