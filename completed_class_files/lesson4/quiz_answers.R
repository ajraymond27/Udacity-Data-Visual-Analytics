#Repeat values multiple times
q = rep(3.2, times=10)
q

#load values in increments
w = seq(0,1, by=0.1)
w

#load values in equally spaced increments
w = seq(0,1, length.out = 11)
w

#Comparison Commands
any = any(w<=0.5)
any

which = which(w<=0.5)
which

#Subset Commands
print(w[w<=0.5])

print(subset(w, w<=0.5))

w[w<=0.5]= 0
w

#creating arrays
z = seq(1, 20, length.out = 20)
x = array(data = z, dim = c(4, 5))
x

print(x[-1, ])

print(x[1,] %*% x[1,])

print(t(x))

print(outer(x[,1], x[,1]))

print(rbind(x[1,], x[1,]))

print(cbind(x[1,], x[1,]))



y = x[c(1,2), c(1,2)]
y

print( 2 * y + 1)

print(y %*% y)

#Lists
L = list(name = 'John', age=55, no.children = 2, children.ages = c(15,18))
L

print(names(L))

print(L['name'])

print(L[[2]])

print(L$children.ages[2])

print(L$name)

print(L[[4]][2])

#Iris

data(iris)
iris

print(mean(iris$Sepal.Length))
      
print(which(iris$Species == 'setosa'))

print(subset(iris, iris$Sepal.Length < 5 & iris$Species == 'setosa'))
