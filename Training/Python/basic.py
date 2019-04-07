#!/usr/bin/python

a = 10
b = 20
c = 0

if ( a and b ):
   print "Line 1 - a and b are true"
else:
   print "Line 1 - Either a is not true or b is not true"

if ( a or b ):
   print "Line 2 - Either a is true or b is true or both are true"
else:
   print "Line 2 - Neither a is true nor b is true"


a = 0
if ( a and b ):
   print "Line 3 - a and b are true"
else:
   print "Line 3 - Either a is not true or b is not true"

if ( a or b ):
   print "Line 4 - Either a is true or b is true or both are true"
else:
   print "Line 4 - Neither a is true nor b is true"

if not( a and b ):
   print "Line 5 - a and b are true"
else:
   print "Line 5 - Either a is not true or b is not true"
var = 150
if var < 200:
    print ("Expression value is less than 200")
    if var == 150:
        print "Value is 150"
    elif var == 100:
        print "Value is 100"
    elif var == 50:
        print ("Value is 50")
elif var < 50:
    print "Expression value is less than 50"
else:
    print "Could not find true expression"
   
print "Good bye!"
z = 3
if z==1:
    print 'z is equal to 1'
elif z==2:
    print 'z is equal to 2'
elif z==3:
    print 'z is equal to 3'
else:
    print 'z is not equal to 1 or 2 or 3'#using raw_input
age=raw_input('Enter your age : ')
print ("Your age is %d" % int(age));

#using input
number=input('\nEnter any number : ')
print ("You entered %d" % number);#using raw_input
name=raw_input('Enter your name : ')
print ("Hi %s, Let us be friends!" % name);

#using only input
#remember to you double quotes ("") while giving input
place=input('\nWhere do you live? : ')
print ("I live in %s" % place);#!/usr/bin/python

a = 20
b = 10
c = 15
d = 5
e = 0

e = (a + b) * c / d       #( 30 * 15 ) / 5
print "Value of (a + b) * c / d is ",  e

e = ((a + b) * c) / d     # (30 * 15 ) / 5
print "Value of ((a + b) * c) / d is ",  e

e = (a + b) * (c / d);    # (30) * (15/5)
print "Value of (a + b) * (c / d) is ",  e

e = a + (b * c) / d;      #  20 + (150/5)
print "Value of a + (b * c) / d is ",  e
#!/usr/bin/python

a = 21
b = 10
c = 0

if ( a == b ):
   print "Line 1 - a is equal to b"
else:
   print "Line 1 - a is not equal to b"

if ( a != b ):
   print "Line 2 - a is not equal to b"
else:
   print "Line 2 - a is equal to b"

if ( a <> b ):
   print "Line 3 - a is not equal to b"
else:
   print "Line 3 - a is equal to b"

if ( a < b ):
   print "Line 4 - a is less than b" 
else:
   print "Line 4 - a is not less than b"

if ( a > b ):
   print "Line 5 - a is greater than b"
else:
   print "Line 5 - a is not greater than b"

a = 5;
b = 20;
if ( a <= b ):
   print "Line 6 - a is either less than or equal to  b"
else:
   print "Line 6 - a is neither less than nor equal to  b"

if ( b >= a ):
   print "Line 7 - b is either greater than  or equal to b"
else:
   print "Line 7 - b is neither greater than  nor equal to b"
import sys

iNum=5
print ("\nSizeof iNum  is",sys.getsizeof(iNum),"\n")

name="Vikas karanth"
print ("\nSizeof name  is",sys.getsizeof(name),"\n")

fNum=3.14
print ("\nSizeof fNum  is",sys.getsizeof(fNum),"\n")

print ("\nSizeof 10000  is",sys.getsizeof(10000),"\n")

