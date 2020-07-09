/*
	File name: ukqll.c 	
	Author   : Uthara Keerthan R
	Date     : 18/7/15
	Purpose  : Implementation of queue using linked list.
*/
#include<stdio.h>
#include<stdlib.h>

struct node
{
	int data;
	struct node *next;
};

typedef struct node Node;

Node *create()
{
	Node* new;
	new=(Node*)malloc(sizeof(Node));
	return new;
}

Node *front;
Node *rear;
Node *fptr;

void enqueue(int no)
{
	if(fptr==NULL)
	{
		rear=create();
		rear->data=no;
		rear->next=NULL;
		fptr=rear;
		front=rear;

	}
	else
	{
		while(rear->next!=NULL)
		{
			rear=rear->next;
		}
		rear->next=create();
		rear=rear->next;
		rear->data=no;
		rear->next=NULL;
	}
}

int dequeue()
{
	int num;
	num=front->data;
	front=front->next;
	free(fptr);
	fptr=front;
	return num;


}

void display()
{
	while(fptr!=NULL)
	{
	printf("\n %d",fptr-> data);
	fptr=fptr->next;
	}
}

int menu()
{
	int opt;
	printf("\n Enter an appropriate value:");
	printf("\n 1-Enqueue\t 2-Dequeue\t 3-Display\t 4-Exit");
	scanf("%d",&opt);

	return opt;
}

main()
{
	int num,op;

	fptr=NULL;rear=NULL;front=NULL;

	do 
	{
		switch(menu())
		{
			case 1 : printf("Enter the element to be added to the queue:");
				    scanf("%d",&num);
				    enqueue(num);
				    break;

			case 2 : op=dequeue();
				    printf("\n The dequeued element from the queue is:%d",op);
				    break;
				    
			case 3 : display();
				    break;

			case 4 : exit(1);
			         break;

			default: printf("\n Enter a valid operation!");	    
		}

	}while(1);
}
