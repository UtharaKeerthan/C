for letter in 'Python':     # First Example
   if letter == 'h':
      break
   print ('Current Letter :', letter)
########################################################### 
var = 10                           # Second Example
while var > 0:              
   print ('Current variable value :', var)
   var = var -1
   if var == 5:
      break
else:
   print ("Good bye!")
for letter in 'Python':     # First Example
   if letter == 'h':
      break
   print ('Current Letter :', letter)
########################################################### 
var = 10                           # Second Example
while var > 0:              
   print ('Current variable value :', var)
   var = var -1
   if var == 5:
      pass      
#break
else:
   print ("Good bye!")
for letter in 'Python':     # First Example
   if letter == 'h':
      continue
   print ('Current Letter :', letter)

var = 10                    # Second Example
while var > 0:              
   print ('Current variable value :', var)
   var = var -1
   if var == 5:
      continue
   print ("Good bye!")
#!/usr/bin/python

for num in range(10,20):  #to iterate between 10 to 20
   for i in range(2,num): #to iterate on the factors of the number
      if num%i == 0:      #to determine the first factor
         j=num/i          #to calculate the second factor
         print '%d equals %d * %d' % (num,i,j)
         break #to move to the next number, the #first FOR
   else:                  # else part of the loop
      print num, 'is a prime number'
#!/usr/bin/python

for letter in 'Python':     # First Example
   print 'Current Letter :', letter

fruits = ['banana', 'apple',  'mango']
for fruit in fruits:        # Second Example
   print 'Current fruit :', fruit

print "Good bye!"
#!/usr/bin/python

fruits = ['banana', 'apple',  'mango']
for index in range(len(fruits)):
   print 'Current fruit :', fruits[index],"At index: ", index

print  type(fruits)
print "Good bye!"
#!/usr/bin/python

i = 2
while(i < 100):
   j = 2
   while(j <= (i/j)):
      if not(i%j): break
      j = j + 1
   if (j > i/j) : print i, " is prime"
   i = i + 1

print "Good bye!"
#!/usr/bin/python

for letter in 'Python': 
   if letter == 'h':
      pass
      print ('This is pass block')
   print ('Current Letter :', letter)

print ("Good bye!")
#!/usr/bin/python

count = 0
while count < 5:
   print count, " is  less than 5"
   count = count + 1
else:
	print count, " is not less than 5"
	print "Bte.....!"
   
number = 0
while (number < 9):
    print 'The number is:', number
    number = number + 1

print "Good bye!"