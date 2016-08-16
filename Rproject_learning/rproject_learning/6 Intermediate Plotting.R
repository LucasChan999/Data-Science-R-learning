#Intermediate Plotting中间绘图

#1 Continuous data  连续数据

#1.1 Multiple Data on One Plot;create the initial plot and then add additional information to the plot
x <- rnorm(10, sd = 5, mean = 20)
y <- 2.5 * x - 1.0 + rnorm(10, sd = 9, mean = 0)
cor(x, y)

plot(x, y, xlab = "Independent", ylab = "Dependent", main = "Random Stuff")

x1 <- runif(8, 15, 25) #uniform distribution 均值分布

y1 <- 2.5 * x1 - 1.0 + runif(8, -6, 6)

points(x1, y1, col = 3) #在原来的图的基础上添加新的圈图 ；由col定义颜色
#########
x2 <- runif(8, 15, 25)
y2 <- 2.5 * x2 - 1.0 + runif(8, -6, 6)
points(x2, y2, col = 3, pch = 2) #使用pch定义形状
#########
plot(x, y, xlab = "Independent", ylab = "Dependent", main = "Random Stuff")
points(x1, y1, col = 2, pch = 3)
points(x2, y2, col = 4, pch = 5)
legend(14, 70, c("Original", "one", "two"), col = c(1, 2, 4), pch = c(1, 3, 5)) #分别对前面三种图形进行图案名称，形状和颜色的定义


#1.2 Error Bars 误差条：使用arrows 命令
plot(x, y, xlab = "Independent", ylab = "Dependent", main = "Random Stuff")
xHigh <- x
yHigh <- y + abs(rnorm(10, sd = 3.5))
xLow <- x
yLow <- y - abs(rnorm(10, sd = 3.1))
arrows(xHigh, yHigh, xLow, yLow, col = 2, angle = 90, length = 0.1, code = 3)


#1.3Adding Noise (jitter) 
numberWhite <- rhyper(400, 4, 5, 3) #rhyper 超几何分布
numberChipped <- rhyper(400, 2, 7, 3)
par(mfrow = c(1, 2))

plot(numberWhite, numberChipped, xlab = "Number White Marbles Drawn", ylab = "Number Chipped Marbles Drawn", main = "Pulling Marbles")

plot(jitter(numberWhite), jitter(numberChipped), xlab = "Number White Marbles Drawn", ylab = "Number Chipped Marbles Drawn", main = "Pulling Marbles Jitter")

#1.4 Multiple Graphs on One Image 在图片上面添加新的图型
#关于mfrow: 第一个数：图片的行的数量，第二个数是图片的列的数量

par(mfrow = c(2, 3))
hist(numberWhite, main = "firstPlot")
hist(numberChipped, main = "secondPlot")
plot(jitter(numberWhite), jitter(numberChipped), xlab = "Number White Marbles Drawn",
       ylab = "Number Chipped Marbles Drawn", main = "Pulling Marbles With Jitter")
plot(numberWhite, main = "forth plot")
plot(numberChipped, main = "fifth plot")
mosaicplot(table(numberWhite, numberChipped), main = "sixth plot")

#1.5. Density Plots
#使用smoothScatter命令绘制密度分布图
numberWhite <- rhyper(30, 4, 5, 3)
numberChipped <- rhyper(30, 2, 7, 3)
par(mfrow(1, 1))
smoothScatter(numberWhite, numberChipped, xlab = "White Marbles", ylab = "Chipped Marbles", main = "Drawing Marbles")

grid(4, 3) #对密度图进行3行4列的分隔，帮助请找到需要的点


#1.6 Pairwise Relationships 一次性绘制大量的关系
uData <- rnorm(20)
vData <- rnorm(20, mean = 5)
wData <- uData + 2 * vData + rnorm(20, sd = 0.5)
xData <- -2 * uData + rnorm(20, sd = 0.1)
yData <- 3 * vData + rnorm(20, sd = 2.5)
d <- data.frame(u = uData, v = vData, w = wData, x = xData, y = yData)
pairs(d)

#1.7 Shaded Regions :输入一对向量，使用polygon对坐标轴包围的区域画阴影；
x = c(-1, 1, 1, -1, -1)
y = c(-1, -1, 1, 1, -1)
plot(x, y)
polygon(x, y, col = 'blue')

#####做出一个正概率分布函数曲线图
stdDev <- 0.75;
x <- seq(-5, 5, by = 0.01)
y <- dnorm(x, sd = stdDev)
right <- qnorm(0.95, sd = stdDev)
plot(x, y, type = "l", xaxt = "n", ylab = "p",
       xlab = expression(paste('Assumed Distribution of ', bar(x))),
       axes = FALSE, ylim = c(0, max(y) * 1.05), xlim = c(min(x), max(x)),
frame.plot = FALSE)
#####做出剩下的轴，然后画出阴影
axis(1, at = c(-5, right, 0, 5),
       pos = c(0, 0),
       labels = c(expression(' '), expression(bar(x)[cr]), expression(mu[0]), expression(' '))) #x轴，此处的expression命令用来写希腊字母和下标
axis(2) #y轴
xReject <- seq(right, 5, by = 0.01)
yReject <- dnorm(xReject, sd = stdDev)
polygon(c(xReject, xReject[length(xReject)], xReject[1]),
          c(yReject, 0, 0), col = 'red')

#1.8 Plotting a Surface：persp 命令
x <- seq(0, 2 * pi, by = pi / 100)
y <- x
xg <- (x * 0 + 1) %*% t(y)
yg <- (x) %*% t(y * 0 + 1) # %*% 用来进行矩阵乘法
f <- sin(xg + yg)
persp(x, y, f, theta = -10, phi = 40) #绘制出一个3D图形的表面


#2 Discrete Data 离散数据
#2.1 BarPlot 条形图
numberWhite <- rhyper(30, 4, 5, 3)

numberWhite <- as.factor(numberWhite) #cast the data as factors and ensures that R treats it as discrete data. 

plot(numberWhite)
######
numberWhite <- rhyper(30, 4, 5, 3)
totals <- table(numberWhite)
totals
barplot(totals, main = "Number Draws", ylab = "Frequency", xlab = "Draws")
######
rownames(totals) <- c("none", "one", "two", "three") #为每一列命名
barplot(totals, main = "Number Draws", ylab = "Frequency", xlab = "Draws")

barplot(sort(totals, decreasing = TRUE), main = "Number Draws", ylab = "Frequency", xlab = "Draws") #按照由高到低排列

#可以人为的为数据任意排序
totals
totals[c(3, 2, 1, 4)] #依次是原来数据的第3位，第2位，第1位，第4位；

xLoc = barplot(sort(totals, decreasing = TRUE), main = "Number Draws",
     ylab = "Frequency", xlab = "Draws", ylim = c(0, sum(totals) + 2))
points(xLoc, cumsum(sort(totals, decreasing = TRUE)), type = 'p', col = 2)
points(xLoc, cumsum(sort(totals, decreasing = TRUE)), type = 'l')

#2.2 Mosaic Plot
santa <- data.frame(belief = c('no belief', 'no belief', 'no belief', 'no belief',
                               'belief', 'belief', 'belief', 'belief',
                               'belief', 'belief', 'no belief', 'no belief',
                               'belief', 'belief', 'no belief', 'no belief'),
                      sibling = c('older brother', 'older brother', 'older brother', 'older sister',
                                'no older sibling', 'no older sibling', 'no older sibling', 'older sister',
                                'older brother', 'older sister', 'older brother', 'older sister',
                                'no older sibling', 'older sister', 'older brother', 'no older sibling')
                      ) #先制作一分虚拟的调查记录表
par(mfrow = c(2, 2)) #将下列四个图画在一起
plot(santa$belief)
plot(santa$sibling)

plot(santa$sibling, santa$belief)
plot(santa$belief, santa$sibling)
####
totals <- table(santa$belief, santa$sibling)

mosaicplot(totals, main = "Older Brothers are Jerks",
              xlab = "Belief in Santa Claus", ylab = "Older Sibling", col = c(2, 3, 5))

####
rownames(totals)

colnames(totals)
rownames(totals) <- c("Believes", "Does not Believe")
colnames(totals) <- c("No Older", "Older Brother", "Older Sister")
totals
mosaicplot(totals, main = "Older Brothers are Jerks",
              xlab = "Belief in Santa Claus", ylab = "Older Sibling")

#使用一个二维数组手动改变表中的位置
totals[c(2, 1), c(2, 3, 1)]

#3 miscellaneous option 杂项选项
#3.1 Multiple Representation On One Plot
x = rexp(20, rate = 4)
hist(x, ylim = c(0, 18), main = "This Is An Histogram", xlab = "X")
boxplot(x, at = 16, horizontal = TRUE, add = TRUE)
rug(x, side = 1)
d = density(x)
points(d, type = 'l', col = 3)


#3.2 Multiple Windows
#create different plots on different devices
#创建三个新的设备
dev.new()
dev.new()
dev.new()

dev.list() #浏览创建好的列表
dev.set(3) #x选取其中的一个
x = rnorm(20)
hist(x)

dev.set(4) #选取一个设备编号
qqnorm(x)
qqline(x)

#3.3 Print To A File 
x = rnorm(100)
hist(x)
dev.print(device = png, width = 200, "hist.png") #注意使用dev.set（）切换到ide下才能进行打印

#3.4 Annotation and Formatting 注释与格式
x <- rnorm(10, mean = 0, sd = 4)

y <- 3 * x - 1 + rnorm(10, mean = 0, sd = 2)

summary(y)

plot(x, y, axes = FALSE, col = 2)

axis(1, pos = c(0, 0), at = seq(-7, 5, by = 1))
axis(2, pos = c(0, 0), at = seq(-18, 11, by = 1))#at 命令用来指定刻度
#######
x <- rnorm(10, mean = 0, sd = 4)

y <- 3 * x - 1 + rnorm(10, mean = 0, sd = 2)

plot(x, y, bty = "7")#通过修改bty，使图形获得不同的边框
plot(x, y, bty = "n")

box(lty = 3) #box命令也可以用来设置边框，此时对应四边为虚线

#######先设定参数，再画出对应的图形
par(bty = "l") #中间的是字母l;
par(bg = "gray")
par(mex = 2)
x <- rnorm(10, mean = 0, sd = 4)
y <- 3 * x - 1 + rnorm(10, mean = 0, sd = 2)
plot(x, y)

#######plot后再在图上放置字段:text命令
x <- rnorm(10, mean = 0, sd = 4)
y <- 3 * x - 1 + rnorm(10, mean = 0, sd = 2)
plot(x, y)
text(-1,-2,"numbers")
#
text(-7,-2,"outside the area",xpd = TRUE)#当部分文字超出轴包围的显示范围时，xpd使字段仍然能完整显示



