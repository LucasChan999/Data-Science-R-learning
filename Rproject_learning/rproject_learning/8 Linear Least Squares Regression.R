#Linear Least Squares Regression 线性最小二乘回归
year <- c(2000, 2001, 2002, 2003, 2004)
rate <- c(9.34, 8.50, 7.62, 6.93, 6.60)

plot(year, rate,
     main = "Commercial Banks Interest Rate for 4 Year Car Loan",
     sub = "http://www.federalreserve.gov/releases/g19/20050805/")

cor(year, rate) #计算相关性 : -0.9880813

#assume  slope-intercept form(斜截式): rate=(slope)year+(intercept)
#使用lm命令
fit <- lm(rate~year) #************************************#
fit 

attributes(fit) #查看所有属性值，选择自己感兴趣的属性

fit$coefficients[1] #(Intercept) 
                    #1419.208
fit$coefficients[[1]] #1419.208 只获取数值

#根据公式和前面的获得的值，获得2015年的利率
fit$coefficients[[2]] * 2015 + fit$coefficients[[1]]

#用来计算残差residual(际观察值与估计值之间的差)
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










