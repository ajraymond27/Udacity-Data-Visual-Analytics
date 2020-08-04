library(ggplot2)

################################################################################
#Power Transformations
# Used when data is drawn from highly skewed distributions
# 

print(diamonds[1:10, 1:10])

#skewed right
diamondsSubset = diamonds[sample(dim(diamonds) [1], 1000),]
qplot(price, data = diamondsSubset)

# apply power transformation to reveal a bimodal relationship
qplot(log(price), size = I(1), data = diamondsSubset)

# examine relationships between two or more variables 
# this one shows a postive correlation between carats and price
qplot(carat, price, size = I(1), data = diamondsSubset)

#transform price with log()
qplot(carat, log(price), size = I(1), data = diamondsSubset)

#transform carat with log()
qplot(log(carat), price, size = I(1), data = diamondsSubset)

#transform carat and price with log()
#shows a linear relationship between the two on the log log scale
qplot(log(carat), log(price), size = I(1), data = diamondsSubset)

#QUIZ: Power Transformation
library(MASS)
print(Animals[1:12,])
qplot(brain, body, data = Animals)

#Change the qplot command to show the relationship between the body and brain mass on a log log scale
qplot(log(brain), log(body), data = Animals)


#Data Transformations: Binning
  #numeric variable - represents real valued measurements
  #ordinal variable - represents measurements in a certain range for which we have a well defined order relation
  #categorical variable - represents measurements that do not satisfy the ordinal or numeric assumptions
  #Binning (Discretization) - taking a numeric variable, dividing it by its range into several bins, and replacing it with a number representing the corresponding bin
  #Binarization - a special case of binning (replaces a variable with either 0 or 1 depending on whether the variable is greater or smaller than a threshold)
  # Use the function cut() to discretize

# Data Transformations: Indicator Variables
  #Replace a variable x (numeric, ordinal, or categorical) taking k values with a binary k-dimensional vector v, such that v[i] is one if and only if x takes on the i-value in its range
  # Often, indicator variables are used in conjunction with binning: bin the variable into k bins then create a k dimensional indicator variable
  # High dimensional indicator vectors may be easily handled by taking advantage of its extreme sparsity
  # models for numeric or binary data cannot directly model ordinal or categorical data
  # SO ... transform the data using several non-linear transformations, bin the transformed data, and create indicator vectors
  # Its often easier to compute with indicator functions since they are binary - which may improve scalability


# Data Manipulations: Shuffling
  # A common operation in data analysis is to select a random subset of rows of a dataframe with or without replacement
  # sample() accepts a vector of values from which to sample, the number of samples, whether or not to replace, and the probability of sampling different values
  # sample(k,k) generates a random permutation of order k

D = array(data = seq(1,20, length.out = 20), dim = c(4,5))
D_shuffled = D[sample(4,4),]

# Data Manipulations: Partitioning
  #In some cases we need to partition the dataset's rows into two or more collections of rows
  #Generate a random permutation of k objects using sample(k,k) where k is the number of rows in the data, and then dive the permuation vector into two or more parts based on the prescribed sizes
  # and new dataframes whose rows correspond to the divided permutation vector

D = array(data = seq(1,20, length.out = 20), dim = c(4,5))
rand_perm = sample(4,4)
first_set_of_indices = rand_perm[1:floor(4*0.75)]
second_set_of_indices = rand_perm[(floor(4*0.75)+1):4]
D1 = D[first_set_of_indices, ]
D2 = D[second_set_of_indices, ]
print(D1)
print(D2)

# Tall Data
  #Data in Tall format is an array or dataframe containing multiple columns where one or more columns act as a unique identifier and an additional column represents value
  # Think of a grocery data set - you can use checkout time and item together as a unique identifier
  # its convenient for adding new records incrementally and for removing old records
  # But it is difficult to conduct analysis on it

# Wide Data
  #represents in multiple columns the information that tall data holds in multiple rows
  # much simpler to analyze
  # But harder to add / remove entries

#Reshape Data
library(reshape2)
print(smiths)

#reshape from wide to tall ... melt()
smiths_tall = melt(smiths, id=1)
print(smiths_tall[1:4, ])

#reshape from tall to wide ... acast() or dcast()

#inspect data(tips)
qplot(total_bill, tip, facets = sex~time, size=I(1.5), data = tips)
names(tips)

#reshape from wide to tall
tipsm = melt(tips, id = c("sex", "smoker", "day", "time", "size"))

#reshape back to wide to compare expenditure by sex
dcast (tipsm, sex~variable, fun.aggregate = mean)

#reshape back to wide to compare occurences by sex
dcast(tipsm, sex~variable, fun.aggregate = length)

#reshape back to wide to compare expenditure by time
dcast (tipsm, time~variable, fun.aggregate = mean)

#reshape back to wide to compare occurrences by sex and time
dcast (tipsm, sex+time~variable, fun.aggregate = length)

#reshape back to wide to compare expenditure by sex and time
dcast (tipsm, sex+time~variable, fun.aggregate = mean, margins = TRUE)


#Split - Align - Combine
 #Many data analysis operations on dataframes can be decomposed to three stages:
  # 1. splitting the dataframe along some dimensions to form smaller arrays or dataframes
  # 2. applying some operation to each of the smaller arrays or dataframes
  # 3. combining the results of the application stage into a single meaningful one

library(plyr)
names(baseball)

bbPerYear = ddply(baseball, "year", "nrow")
head(bbPerYear)

qplot(x = year, y = nrow, data = bbPerYear, geom = "line", ylab = "Number of players per seasons")


#compute mean rbi for all years. Summarize is the apply function which takes as argument a function that computes rbi mean
bbMod = ddply(baseball, "year", summarise, mean.rbi = mean(rbi, na.rm = TRUE))
qplot(x = year, y = mean.rbi, data = bbMod, geom = "line", ylab = "mean RBI")

#add a column career.year which measures the number of years passed since each player started batting
bbMod2 = ddply(baseball, "id", transform, career.year = year - min(year)+1)
bbSubset = bbMod2[sample(dim(bbMod2)[1], 3000),]

qplot(career.year, rbi, data = bbSubset, size = I(0.8), geom = "jitter", ylab = "RBI", xlab = "years of playing") + geom_smooth(color = "red", se = F, size=1.5)


#Ozone Example
# data(ozone) contains a 3-dim array of ozone measurements varying by latitude. longitude, and time

latitude.mean = aaply(ozone, 1, mean)
longtiude.mean = aaply(ozone, 2, mean)
time.mean = aaply(ozone, 3, mean)

#plot ozone level across longitudes
longitude = seq(along = longtiude.mean)
qplot(x = longitude, y = longtiude.mean, ylab = "mean ozone level", geom = "line")

#plot ozone levels across latitudes
latitude = seq(along = latitude.mean)
qplot( x = latitude, y = latitude.mean, ylab = "mean ozone level", geom = "line")

#plot mean ozone levels across time
months = seq(along = time.mean)
qplot(x = months, y = time.mean, geom = "line", ylab = "mean ozone level", xlab = "months since Jan 1985")