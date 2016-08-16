#Calculating the Power of a test 计算统计检验力
#Contents:
#  Calculating The Power Using a Normal Distribution
#  Calculating The Power Using a t Distribution
#  Calculating Many Powers From a t Distribution


#1 Calculating The Power Of A Test 

# 定义：The power of a test is the probability that we can the reject null hypothesis at a given mean that is away from the one specified in the null hypothesis
# The power is the probability that we do not make a type II error

a <- 5 #均值
s <- 2 #标准差
n <- 20 #样本数目

error <- qnorm(0.975) * s / sqrt(n)

left <- a - error
right <- a + error

assumed <- a + 1.5 #此处设定预期平均值

Zleft <- (left - assumed) / (s / sqrt(n))
Zright <- (right - assumed) / (s / sqrt(n))

p <- pnorm(Zright) - pnorm(Zleft)
p

#The probability that we make a type II error if the true mean is 6.5（a+1.5) is approximately 8.1%. 
#So the power of the test is 1-p
1 - p # 0.9183621

#2 Calculating The Power Using a t Distribution t分布计算检验统计力
a <- 5 #均值
s <- 2 #标准差
n <- 20 #样本数目

error <- qt(0.975, df = n - 1) * s / sqrt(n) #添加了自由度

left <- a - error
right <- a + error

assumed <- a + 1.5

tleft <- (left - assumed) / (s / sqrt(n))
tright <- (right - assumed) / (s / sqrt(n))

p <- pt(tleft, df = n - 1) - pt(tright, df = n - 1)

# probability that we make a type II error if the true mean is 6.5 is approximately 11.1%.
p  #0.1112583

#the power of test is 1-p 
1 - p # 0.8887417 ： 拒绝原假设的概率

#3Calculating Many Powers From a t Distribution 从t分布计算多个统计检验力 

m1 <- c(10, 12, 30)
m2 <- c(10.5, 13, 28.5)
sd1 <- c(3, 4, 4.5)
sd2 <- c(2.5, 5.3, 3)
num1 <- c(300, 210, 420)
num2 <- c(230, 340, 400)
se <- sqrt(sd1 * sd1 / num1 + sd2 * sd2 / num2) #标准差standard error的计算

#use the pmin command to get the number of degrees of freedom
left <- qt(0.025, df = pmin(num1, num2) - 1) * se

right <- -left

tl <- (left - 1) / se
tr <- (right - 1) / se

probII <- pt(tr, df = pmin(num1, num2) - 1) - pt(tl, df = pmin(num1, num2) - 1)

#得出结果
power <- 1 - probII


