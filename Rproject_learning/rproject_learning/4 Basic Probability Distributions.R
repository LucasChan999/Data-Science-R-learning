#Basic Probability Distributions 基本概率分布
#对每种分布 都有以下四种命令：

#“d”	returns the height of the probability density function 概率密度函数的高度
#“p”	returns the cumulative density function 累计分布函数
#“q”	returns the inverse cumulative density function (quantiles) 逆累计分布函数
#“r”	returns randomly generated numbers 随机生成数

#normal distribution 正太分布
help(Normal)
#dnorm :returns the height of the probability distribution at each point 
dnorm(0) 

dnorm(0) * sqrt(2 * pi)  #默认均值为0，标准差为1

dnorm(0, mean = 4) #设置均值为4

dnorm(0, mean = 4, sd = 10) #设置均值为4，标准差为10

v<-c(0,1,2)
dnorm(v)

x <- seq(-20, 20, by = .1) #从-20至20 间隔为0.1 的数组
y <- dnorm(x)

plot(x, y)

y <- dnorm(x,mean = 2.5, sd = 0.1)

#pnorm :computes the probability that a normally distributed random number will be less than that number
pnorm(0) #0.5

pnorm(1)

pnorm(0, mean = 2)

pnorm(0, mean = 2,sd = 3)
########
x <- seq(-20, 20, by = .1)
y = pnorm(x)

plot(x,y)
########
y = pnorm(x,mean = 2,sd = 3)
plot(x,y)

#lower.tail : help to find the probability that a number is larger than the given number 
pnorm(0, lower.tail = FALSE)

pnorm(1,lower.tail = FALSE)

# qnorm :give it a probability, and it returns the number whose cumulative distribution matches the probability.
qnorm(0.5) #0

qnorm(0.5, mean = 1) # 1

qnorm(0.5, mean = 1, sd = 2) #1

qnorm(0.5,mean = 2 ,sd = 4) #2
##########
x <- seq(0, 1, by = .05)

y = qnorm(x)
plot(x, y)
##########
y = qnorm(x, mean = 2, sd = 3)

plot(x, y)
##########
y = qnorm(x,mean = 2,sd = 0.1)

# rnorm: generate random numbers whose distribution is normal

rnorm(4) # 0.8909032 -0.2109115  0.5598184 -0.2383159
rnorm(2) # 0.7416620 0.8953557

rnorm(4,mean = 2 ,sd = 3)
##########
y = rnorm(200)
hist(y) #生成直方分布图

qqnorm(y)
qqline(y) #QQ图：用于判断是否正态分布；直线的斜率是标准差，截距是均值；点的散布越接近直线 ，则越接近正态分布



#The t Distribution t分布 :dt, pt, qt, and rt.多了个自由度df
help(TDist)

x<- seq(-20,20,by = .5)
y = dt(x,df = 10) #df :degrees of freedom

plot(x, y)
#########
x <- seq(-20, 20, by = .5)
y = dt(x,df = 50)
plot(x, y)

#pt:返回概率值
pt(3, df = 10)     #0.9933282
pt(-3, df = 10)    #0.006671828

1 - pt(3, df = 10) #0.006671828

#qt:返回对应概率值得数值
qt(0.05, df = 10) #-1.812461
qt(0.95, df = 10) # 1.812461

v <- c(0.005,0.05,0.5)
qt(v, df = 10)  # -3.169273 -1.812461  0.000000
qt(v, df = 100) # -2.625891 -1.660234  0.000000

#rt 
rt(4, df = 10)
rt(4, df = 20)
rt(4, df = 30)


#The Binomial Distribution 二项分布：额外参数：the number of trials and the probability of success for a single trial
help(Binomial)

x<-seq(0,50,by = 1)

y = dbinom(x, 50, .2)
plot(x,y)
##########

y = dbinom(x,50,.6)
plot(x,y)


#pbinom
pbinom(24, 50, 0.5)

pbinom(25, 50, 0.5)

pbinom(25, 51, 0.5)

pbinom(26, 51, 0.5)

pbinom(25, 50, 0.5)

pbinom(25, 50, 0.25)

pbinom(25, 500, 0.25)

#qbinom
pbinom(25, 51, 1 / 2) #0.5

pbinom(23, 51, 1 / 2) #0.2879247

qbinom(0.5, 51, 1 / 2) #25

qbinom(0.2879247, 51, 1 / 2) #24

#rbinom:
rbinom(5, 100, .2) #23 20 20 16 25

#The Chi - Squared Distribution 卡方分布:不能定义均值 需要定义自由度
help(Chisquare)

#dchisq
x <- seq(-20, 20, by = .5)
y = dchisq(x,df = 10)

plot(x,,y)

y = dchisq(x,df = 12)
plot(x, y)

#pchisq
pchisq(3,df = 10)

pchisq(-3, df = 10)

v<-c(1,2,3,4)

pchisq(v,df = 10)

#qchisq
qchisq(0.05, df = 10)

qchisq(0.95, df = 10)

qchisq(0.05, df = 20)

qchisq(0.95, df = 20)

v <- c(0.005, 0.05, 0.5)

qchisq(v,df = 10 )

# rchisq
rchisq(3, df = 10)

