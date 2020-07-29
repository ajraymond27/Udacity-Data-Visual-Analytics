reddit <- read.csv('reddit.csv')

table(reddit$employment.status)

str(reddit)

install.packages('ggplot2', dependencies = T)
library(ggplot2)

qplot(data = reddit, x = age.range)