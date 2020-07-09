#include<stdio.h>
#include<stdlib.h>

typedef struct node_t
{
	int x;
	struct node_t *next;
}node;
void printnode(node *l)
{
	node *current = l;
	while(current != NULL)
	{
		printf("\n %d",current->x);
		current = current->next;
	}

}

node *insertbegin(node *l, int y)
{
	node *current = l;
	node *new;
	new = (node*)malloc(sizeof(node));

	if(current != NULL)
	{
	new->x = y;
	new->next = l;
	return new;
	}
	else
	{
	new->x = y;
	new->next = NULL;
	return new;
	}
}

node *removefront(node *l)
{
	node *current = l;
	
	if(l != NULL)
	{
		current = current->next;
		free(l);
		return current;
	}
	else
	{
		printf("\n The list is empty");
		return l;
	}
}
//node *insertend(node **ptr2head, int y)
//{
//	node *current;
//}

void main(void)
{
	//node n1,n2,n3;
	node *head = NULL;
	int y,i;
	//n1.x = 10;
	//n2.x = 20;
	//n3.x = 30;
	//n1.next = &n2;
	//n2.next = &n3;
	//n3.next = NULL;

	//printnode(&n1); 

	for(i = 0;i < 5;i++)
	{
	printf("\n Enter the new element to be inserted at the begining:");
	scanf("%d", &y);

	head = insertbegin(head,y);
	
	printnode(head);
	}

	for(i = 0;i < 5; i++)
	{
	printf("\n Removing the first element of the list");
	head = removefront(head);
	printnode(head);
	}

	//head = insertempty()

}

