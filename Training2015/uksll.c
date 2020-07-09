/*
	File name: uksll.c	
	Author   : Uthara Keerthan R
	Date     : 18/7/15
	purpose  : Implementation of stack using linked list.
*/
#include<stdio.h>
#include<stdlib.h>

struct node 
{
	int data;
	struct node *next;

};

typedef struct node Node;

Node *fptr;

Node *create()
{
	Node *new;
	new =(Node *)malloc(sizeof(Node));
	return new;
}

int menu()
{
	int opt;

	printf("\n Select an appropriate option:");
	printf("\n 1.PUSH \t2.POP \t3.DISPLAY \t4.EXIT");
	scanf("%d",&opt);
	return opt;
}

void push(Node *p,int no)
{
	Node *temp;
	if (p==NULL)
	{
		p=(Node *)malloc(sizeof(Node));
		p->next=NULL;
		p->data=no;
		fptr=p;
	}
     else
	{
	temp=create();
	temp->data=no;
	temp->next=fptr;
	fptr=temp;
	}
}

int pop(Node *p)
{
	Node *temp;
	int num;

	num=p->data;
	temp=p->next;

	free(p);
	fptr =temp;

	return num;

}


void display(Node* p)
{
	while(p!=NULL)
	{	
		printf("\n %d",p->data);
		p=p->next;
	}
}


main()
{
                                                                  
	int num,op;

	fptr= NULL;

	do
	{
		switch(menu())
		{
			case 1 :printf("\nEnter the element to be pushed in to the stack:");
			 	   scanf("%d",&num);
			   	   push(fptr,num);
			   	   break;
			case 2 :op=pop(fptr);
				   printf("\n The popped element is :%d",op);
				   break;
			case 3 :display(fptr);
			        break;
			case 4 :exit(0);
				   break;

	    default :printf("\n Enter a valid option!");	   
	    }
	}while(1);
}	
