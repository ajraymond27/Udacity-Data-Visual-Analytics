library(ggplot2)
data(faithful)

#QUIZ 1: Create a Strip Plot - one dimensional numeric data as points in a two-dimensional plane with one axis coordinating
#to the index and the other to its value

plot(faithful$eruptions, xlab = "sample number", ylab = "eruption times (min)", main = "Old Faithful Eruption Times")

# We can conclude that Old Faithful has two typical eruption times (~2 mins and ~4 mins)


#QUIZ 2: Histograms - one dimensional numeric data that's divided into bins and counting the number of occurrences or frequency

qplot(x=waiting, data = faithful, binwidth = 3, main = "Waiting time to next eruption (min)")

ggplot(faithful, aes(x=waiting)) + geom_histogram(binwidth = 1)

#Probability Histogram
ggplot(faithful, aes(x = waiting, y = ..density..)) + geom_histogram(binwidth = 4)


#QUIZ 3: Line Plots - shows y values as a function of x values

x = seq(-2, 2, length.out = 30)
y = x^2
qplot(x,y, geom = "line") #line plot
qplot(x, y, geom = c("point", "line"))  #line and point plot
df = data.frame(x=x, y=y)
ggplot(df, aes(x=x, y=y)) + geom_line() + geom_point()  #same as above but with ggplot


#QUIZ 4: Smoothed Histograms - instead of separating data into bins, it shows a curve by using a kernel function (tricube, triangular, uniform, or Gaussian) where h = bandwidth (higher bandwidth = wider histogram)
ggplot(faithful, aes(x = waiting, y = ..density..)) + geom_histogram(alpha = .5) + geom_density(size = 2, color = "red")


#QUIZ 5: Scatter Plot - graphs the relationship between two numeric variables
plot(faithful$eruptions, faithful$waiting, 
     pch=17,
     col=2,
     cex=1.2,
     xlab="waiting times (min)",
     ylab="eruption time (min)")

##############################################################################################
##############################################################################################

library(ggplot2)
data(mtcars)
data(mpg)

install.packages('GGally')
library(GGally)

#QUIZ 6: Categorical variables and scatter plots
# The relationship between two numeric variables and a categorical variable can be graphed using a scatter plot
# where the categorical variable controls the color, size, or shape of the markers

plot(mtcars$hp, mtcars$mpg, pch = mtcars$am,
     xlab = "horsepower",
     cex = 1.2,
     ylab = "mpg",
     main = "mpg vs hp by transmission")
legend("topright", c("automatic", "manual"), pch = c(0,1))

names(mpg)
qplot(x=wt, y=mpg, data=mtcars, size=cyl, main = "MPG vs Weight (x1000 lbs) by cylinder")

#QUIZ 7: Noisy Data - Add a smooth line curve to reveal trends (weighted avg of original data)

names(mtcars)
qplot(x = disp, y = mpg, data = mtcars, 
      main = "MPG vs Displacement") + stat_smooth(method = "loess", degree = 0, span = 0.2, se = TRUE)

#QUIZ 8: Facets - another way to model 3 variables where one is categorical

mtcars$amf[mtcars$am==0] = 'automatic'
mtcars$amf[mtcars$am==1] = 'manual'
mtcars$vsf[mtcars$vs==0] = 'flat'
mtcars$vsf[mtcars$vs==1] = 'V-shape'

#two columns
qplot(x = wt, y = mpg, facets = .~amf, data = mtcars, main = "MPG vs. weight by transmission")

#two rows
qplot(x = wt, y = mpg, facets = vsf~., data = mtcars, main = "MPG vs weight by engine")

#4x4 
qplot(x = wt, y = mpg, facets = vsf~amf, data = mtcars, main = "MPG vs. weight by transmission and engine")

#matrix of plots
DF = mpg[, c('cty', 'hwy', 'displ')]
library(ggplot2)
ggpairs(DF)

# QUIZ 9: Contour Plots - plots relationship between three numeric variables (z as a function of x and y)
# create a grid of x values
# create a grid of y values
# create an expanded x by y grid
# compute values of z on the expanded grid
# graph the data

x_grid = seq(-1, 1, length.out = 100)
y_grid = x_grid
R = expand.grid(x_grid, y_grid)
names(R) = c('x', 'y')
R$z = R$x^2 + R$y^2
ggplot (R, aes(x=x, y=y, z=z)) + stat_contour()


#QUIZ 10: Box Plots: 

ggplot(mpg, aes("", hwy)) + geom_boxplot() + coord_flip() + scale_x_discrete("")

ggplot(mpg, aes(reorder(class, -hwy, median), hwy)) + geom_boxplot() +coord_flip() + scale_x_discrete("class")


#QUIZ 11: QQPlots: scatterplot of quantiles of one dataset on x-axis compared to quantiles of another dataset on y-axis

D = data.frame(samples = c(rnorm(200, 1, 1),
                           rnorm(200, 0, 1),
                           rnorm(200, 0 ,2)))
D$parameter[1:200] = 'N(1,1)';
D$parameter[201:400] = 'N(0,1)';
D$parameter[401:600] = 'N(0,2)';

qplot(samples, facets = parameter~., geom = 'histogram', data = D)

ggplot(D, aes(sample = samples)) + stat_qq() + facet_grid(.~parameter)

