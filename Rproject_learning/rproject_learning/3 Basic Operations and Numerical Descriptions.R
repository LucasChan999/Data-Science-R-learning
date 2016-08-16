#Basic Operations and Numerical Descriptions
#the basic operations that you can perform on lists of numbers(vector)

a <- c(1,2,3,4,5)

a + 1
a - 2
a / 3
a * 4

b <- a-10
b

sqrt(a+3)

exp(a)
log(a)
exp(log(a)) #equals to a

c <- (a + sqrt(a)) / (exp(2) + 1)

a <- c(1, 2, 3)
b <- c(10, 11, 12, 13) 
a + b # 11 13 15 14

a <- c(1, -2, 3, -4)
b <- c(-1, 2, -3, 4)
min(a, b) #get the smallest number of a and b 
pmin(a,b) #get the 4 smallest number of a and b  

ls()

#Basic Numerical Descriptions
tree <- read.csv(file = "trees91.csv", header = TRUE, sep = ",")
names(tree)

tree$LFBM

mean(tree$LFBM) #mean number of this column

median(tree$LFBM)

quantile(tree$LFBM)

var(tree$LFBM) #

max(tree$LFBM) # max number
 
min(tree$LFBM) # min number

sd(tree$LFBM)  #

summary(tree$LFBM)

summary(tree) # print out the summary for every vector in the data frame:


#Operations on Vectors
a = c(1, 5, 6, 4, 2, 9)
b = sort(a)
c = sort(a, decreasing = TRUE)

sum(a) # sum up all the numbers in a 
 