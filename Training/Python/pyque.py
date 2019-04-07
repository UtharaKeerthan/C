# /usr/bin/python

#File name : pyque.py
#Author    : Uthara Keerthan R
#Date      : 30/7/15
#Purpose   : To implement a queue in python

queue=[]

while(input("Enter 1 to proceed or 0 to terminate")):
 print("Enter\n 1-for enqueue\n 2-for dequeue\n 3-for display")
 x=input()
 if x==1:
     queue.append(input("Enter the element to be enqueued"))
 elif x==2:
     print("The dequeued element is",queue.pop(0))
 elif x==3:
     print queue
 else :
     print("Enter a valid mode of operation")
	
