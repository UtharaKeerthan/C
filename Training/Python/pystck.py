#! /use/bin/python

#File name: pystck.py
#Author   : Uthara Keerthan R
#Date     : 30/7/2015
#purpose  : To implement a stack in python

stack=[];

while(input("Enter 1 to proceed or 0 to terminate")):

 print("Enter\n 1-for push\n 2-for pop\n 3-for display")
 x=input()

 if x==1:
    print("Enter the element to be pushed")
    stack.append(input())
 elif x==2:
    print(stack.pop())
 elif x==3:
    print stack
 else:
    print("Enter a valid mode of operation")
