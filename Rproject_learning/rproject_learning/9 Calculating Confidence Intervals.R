#9 Calculating Confidence Intervals ������������
#Contents��
# Calculating a Confidence Interval From a Normal Distribution 
# Calculating a Confidence Interval From a t Distribution
# Calculating Many Confidence Intervals From a t Distribution

#1 Calculating a Confidence Interval From a Normal Distribution ��̫�ֲ�
a <- 5 #sample mean
s <- 3 #standard deviation 
n <- 20 # sample size

error <- qnorm(0.95)*s/sqrt(n) #95 percent confidence level �ٷ�֮95������ˮƽ

lefft <- a - error # 4.123477
right <- a + error # 5.876523
# true mean has a probability of 95% of being in the interval between 4.12 and 5.88 assuming that the original random variable is normally distributed, and the samples are independent. true mean has a probability of 95% of being in the interval between 4.12 and 5.88 assuming that the original random variable is normally distributed, and the samples are independent.

#2 Calculating a Confidence Interval From a t Distribution t�ֲ�

w1 <- read.csv("w1.dat",head = TRUE,sep = ",")
summary(w1)

mean(w1$vals) #��ֵ
sd(w1$vals) #��׼��
length(w1$vals) #��������

error <- qt(0.975, df = length(w1$vals) - 1) * sd(w1$vals) / sqrt(length(w1$vals))
#�������
error
#�����������
left <- mean(w1$vals) - error # 0.6617925
right <- mean(w1$vals) + error # 0.8682075
#��95%�ĸ�����Ϊ�����ľ�ֵ��0.66��0.86

#3 Calculating Many Confidence Intervals From a t Distribution 
# ��t�ֲ��м������������䣬�˴�������

m1 <- c(10, 12, 30)
m2 <- c(10.5, 13, 28.5)
sd1 <- c(3, 4, 4.5)
sd2 <- c(2.5, 5.3, 3)
num1 <- c(300, 210, 420)
num2 <- c(230, 340, 400)
se <- sqrt(sd1 * sd1 / num1 + sd2 * sd2 / num2)
error <- qt(0.975, df = pmin(num1, num2) - 1) * se

left <- (m1 - m2) - error
right <- (m1 - m2) + error



