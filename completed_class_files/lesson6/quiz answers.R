#This file illustrates some basics of R.  

#Please read the code and the comments, then experiment with the code to test 
#any points that remain unclear.  When you  finished experimenting, remove any
#code that generates errors and click submit.


#R does not have strong typing
a = 3.2
a = "a string"

#A newline or semicolon mark the end of a statement
print("The variable 'a' stores:"); print(a)

#stopifnot can be used like an assert statement
stopifnot(a == "a string");
stopifnot(TRUE || FALSE)
stopifnot(!(TRUE && FALSE))

#If-else statements are similar to the conventions of C/C++, Java, javascript,
a = 10; b = 5; c = 1
if (a < b){
  d = 1
}else if (a == b){ #having the } and the else on the same line is essential.
  d = 2
}else{
  d = 3
}
d
stopifnot(d==3)

#So do while loops
sum = 0
i = 1
while(i <= 10){
  sum = sum + i
  i = i + 1
}
stopifnot(sum==55)
sum

#Functions are first-class objects, as reflected in the syntax
mySum = function(a,b){
  return(a + b)
}
stopifnot(mySum(2,2) == 4)
mySum()
#R supports named parameters and default values
myPower = function(bas = 10, pow = 4){
  return(bas^pow)
}
stopifnot(myPower(2,3) == 8)
stopifnot(myPower(pow = 3, bas = 10) == 1000)
stopifnot(myPower(bas = 2) == 16)

myPower()


# Implement the logfact function below so that it computes the logarithm 
# of the factorial of its input, i.e. log(n!).  To avoid overflow, you will
# want to use the fact that log(A*B) = log(A) + log(B).  You may use a while
# loop or recursion, and you use may use R's built-inlog function.

logfact = function(n){
  while(n > 1) {
    log(n) + log(n-1)
    n = n - 1
  }
}

# logfact(100) = 363.7394  # note: you may get a slightly different result
print (logfact(100))



