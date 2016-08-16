#Calculating p Values
#Contents:
#  Calculating a Single p Value From a Normal Distribution
#  Calculating a Single p Value From a t Distribution
#  Calculating Many p Values From a t Distribution
#  The Easy Way

#Ho:μx = a,
#Ho:μx = a,


#1 Calculating a Single p Value From a Normal Distribution
#1) first way is to convert the sample means to their associated Z-score
#2) The other way is to simply specify the standard deviation and let the computer do the conversion

#1)
a <- 5 #  value of a
s <- 2 # standard deviation 
n <- 20 # sample size 
xbar <- 7
z <- (xbar - a) / (s / sqrt(n))
z

2 * pnorm( - abs(z))

#2)
a <- 5
s <- 2
n <- 20
xbar <- 7
2 * (1 - pnorm(xbar, mean = a, sd = s / sqrt(20)))

#2 Calculating a Single p Value From a t Distribution
a <- 5
s <- 2
n <- 20
xbar <- 7
t <- (xbar - a) / (s / sqrt(n))
t

2 * pt( - abs(t), df = n - 1)

#########实例
w1 <- read.csv(file = "w1.dat", sep = ",", head = TRUE)
summary(w1)

length(w1$vals)

t <- (mean(w1$vals) - 0.7) / (sd(w1$vals) / sqrt(length(w1$vals)))
t

2 * pt( - abs(t), df = length(w1$vals) - 1)


#3 Calculating Many p Values From a t Distribution
m1 <- c(10, 12, 30)
m2 <- c(10.5, 13, 28.5)
sd1 <- c(3, 4, 4.5)
sd2 <- c(2.5, 5.3, 3)
num1 <- c(300, 210, 420)
num2 <- c(230, 340, 400)
se <- sqrt(sd1 * sd1 / num1 + sd2 * sd2 / num2)
t <- (m1 - m2) / se

#So the p values can be found using the following R command:
pt(t, df = pmin(num1, num2) - 1)
#to make sure that all of the t-scores are negative
pt( - abs(t), df = pmin(num1, num2) - 1)

#4 The Easy Way
#以上都是使用标准公式完成计算 ；还可以使用t.test命令
x = c(9.0, 9.5, 9.6, 10.2, 11.6)
t.test(x) 

#test against a different mean :use mu parameter
t.test(x,mu = 10)
#单侧检验：add "less "
t.test(x, mu = 10,alternative = "less")

#t.test() 支持同时输入两个向量 进行运算
x = c(9.0, 9.5, 9.6, 10.2, 11.6)
y = c(9.9, 8.7, 9.8, 10.5, 8.9, 8.3, 9.8, 9.0)
t.test(x, y)

