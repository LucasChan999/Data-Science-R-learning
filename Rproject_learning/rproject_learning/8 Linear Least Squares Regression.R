#Linear Least Squares Regression ������С���˻ع�
year <- c(2000, 2001, 2002, 2003, 2004)
rate <- c(9.34, 8.50, 7.62, 6.93, 6.60)

plot(year, rate,
     main = "Commercial Banks Interest Rate for 4 Year Car Loan",
     sub = "http://www.federalreserve.gov/releases/g19/20050805/")

cor(year, rate) #��������� : -0.9880813

#assume  slope-intercept form(б��ʽ): rate=(slope)year+(intercept)
#ʹ��lm����
fit <- lm(rate~year) #************************************#
fit 

attributes(fit) #�鿴��������ֵ��ѡ���Լ�����Ȥ������

fit$coefficients[1] #(Intercept) 
                    #1419.208
fit$coefficients[[1]] #1419.208 ֻ��ȡ��ֵ

#���ݹ�ʽ��ǰ��Ļ�õ�ֵ�����2015�������
fit$coefficients[[2]] * 2015 + fit$coefficients[[1]]

#��������в�residual(�ʹ۲�ֵ�����ֵ֮��Ĳ�)
#1)
res <- rate - (fit$coefficients[[2]] * year + fit$coefficients[[1]])

plot(year,res)
#2)
residuals(fit)

plot(year, fit$residuals)

#*********************#
plot(year, rate,
     main = "Commercial Banks Interest Rate for 4 Year Car Loan",
     sub = "http://www.federalreserve.gov/releases/g19/20050805/")

abline(fit)

summary(fit)









