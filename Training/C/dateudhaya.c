#include<stdio.h>
int year1(int y1,int y2);
int month1(int m1,int y1,int m2,int y2);
int month2(int m2,int y2,int y1,int m1);
int date1(int d1,int m1,int y1,int m2,int y2,int d2);
int date2(int d2,int m1,int m2,int y1,int y2);

main()
{
int m1,d1,y1,m2,y2,d2,day,s1,s2,s3,s4,s5;
printf("d1:");
scanf("%d",&d1);
printf("m1:");
fflush(stdin);
scanf("%d",&m1);
printf("y1:");
fflush(stdin);
scanf("%d",&y1);
printf("d2:");
fflush(stdin);
scanf("%d",&d2);
printf("m2:");
fflush(stdin);
scanf("%d",&m2);
printf("y2:");
scanf("%d",&y2);

printf("\n%d%d%d%d%d%d\n",m1,m2,y1,y2,d1,d2);
s1= year1(y1,y2);
s2=month1(m1,y1,m2,y2);
s3=month2(m2,y2,y1,m1);
s4=date1(d1,m1,y1,m2,y2,d2);
s5=date2(d2,m1,m2,y1,y2);
day=s1+s2+s3+s4+s5;
printf("NO OF DAYS BETWEEN DATE1 & DATE2:%d",day);
}


int year1(int y1,int y2)
{
int sumy=0,i,a;
if(y1==y2)
return(0);
for(i=y1+1;i<y2;i++)
{
if(i%4==0)
a=366;
else
a=365;
sumy=sumy+a;
}
printf("sumy:%d",sumy);
return(sumy);
}


int month1(int m1,int y1,int m2,int y2)
{
int summ1=0,i,a;
if(y1!=y2){
for(i=m1+1;i<=12;i++)
{
switch (i)
{
case 2:
{
  if(y1%4==0)
      a=29;
  else
      a=28;
summ1=summ1+a;
}break;
case 1:
case 3:
case 5:
case 7:
case 8:
case 10:
case 12:
   a=31;
summ1=summ1+a;
   break;
default:
   a=30;
summ1=summ1+a;
printf("summ1 :%d\n",summ1);
return(summ1);
break;}}}
else
return(0);
}


int month2(int m2,int y2,int y1,int m1)
{if(y1==y2)
{if(m1!=m2)
{
{int summ2=0,i,a;
for (i=m1+1; i < m2; i++)
 {
 switch (i)
 {
 case 2:
 {
   if(y2%4==0)
       a=29;
   else
       a=28;
 summ2=summ2+a;
}break;
case 1:
case 3:
case 5:
case 7:
case 8:
case 10:
case 12:
   a=31;
summ2=summ2+a;
   break;
default:
   a=30;
summ2=summ2+a;
break;
}}printf("summ2 :%d\n",summ2);
return(summ2);}}
else{
return(0);
}}
else
{
int summ2=0,i,a;
for(i=1;i<m2;i++)
{
switch (i)
{
case 2:
{
  if(y2%4==0)
      a=29;
  else
      a=28;
summ2=summ2+a;
}break;
case 1:
case 3:
case 5:
case 7:
case 8:
case 10:
case 12:
   a=31;
summ2=summ2+a;
   break;
default:
   a=30;
summ2=summ2+a;
break;
}}printf("summ2 :%d\n",summ2);
return(summ2);}
}


int date1(int d1,int m1,int y1,int m2,int y2,int d2)
{
int b,a;
if(y1==y2)
{if(m1==m2)
a=d2-d1;
return(a);}
else
{
switch (m1)  
{
case 1:
case 3:
case 5:
case 7:
case 8:
case 10:
case 12:
a=31-d1;

 break;    
case 2:
{
  if(y1%4==0)
      b=29;
  else
      b=28;
 a=b-d1;
 break;
}
default:
{a=30-d1;
   
     break;
}}printf("sumd1 :%d\n",a);
return(a);
}}


int date2(int d2,int m1,int m2,int y1,int y2)
{
if(y1==y2&&m1==m2)
return(0);
else{
int i, sumd2=0,n=0;
for(i=1;i<=d2;i++)
{n++;
sumd2=sumd2+n;
}printf("sumd2%d",sumd2);
return(sumd2);
}}














