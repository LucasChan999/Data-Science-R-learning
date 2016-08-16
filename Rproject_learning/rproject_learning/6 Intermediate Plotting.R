#Intermediate Plotting�м��ͼ

#1 Continuous data  ��������

#1.1 Multiple Data on One Plot;create the initial plot and then add additional information to the plot
x <- rnorm(10, sd = 5, mean = 20)
y <- 2.5 * x - 1.0 + rnorm(10, sd = 9, mean = 0)
cor(x, y)

plot(x, y, xlab = "Independent", ylab = "Dependent", main = "Random Stuff")

x1 <- runif(8, 15, 25) #uniform distribution ��ֵ�ֲ�

y1 <- 2.5 * x1 - 1.0 + runif(8, -6, 6)

points(x1, y1, col = 3) #��ԭ����ͼ�Ļ����������µ�Ȧͼ ����col������ɫ
#########
x2 <- runif(8, 15, 25)
y2 <- 2.5 * x2 - 1.0 + runif(8, -6, 6)
points(x2, y2, col = 3, pch = 2) #ʹ��pch������״
#########
plot(x, y, xlab = "Independent", ylab = "Dependent", main = "Random Stuff")
points(x1, y1, col = 2, pch = 3)
points(x2, y2, col = 4, pch = 5)
legend(14, 70, c("Original", "one", "two"), col = c(1, 2, 4), pch = c(1, 3, 5)) #�ֱ��ǰ������ͼ�ν���ͼ�����ƣ���״����ɫ�Ķ���


#1.2 Error Bars �������ʹ��arrows ����
plot(x, y, xlab = "Independent", ylab = "Dependent", main = "Random Stuff")
xHigh <- x
yHigh <- y + abs(rnorm(10, sd = 3.5))
xLow <- x
yLow <- y - abs(rnorm(10, sd = 3.1))
arrows(xHigh, yHigh, xLow, yLow, col = 2, angle = 90, length = 0.1, code = 3)


#1.3Adding Noise (jitter) 
numberWhite <- rhyper(400, 4, 5, 3) #rhyper �����ηֲ�
numberChipped <- rhyper(400, 2, 7, 3)
par(mfrow = c(1, 2))

plot(numberWhite, numberChipped, xlab = "Number White Marbles Drawn", ylab = "Number Chipped Marbles Drawn", main = "Pulling Marbles")

plot(jitter(numberWhite), jitter(numberChipped), xlab = "Number White Marbles Drawn", ylab = "Number Chipped Marbles Drawn", main = "Pulling Marbles Jitter")

#1.4 Multiple Graphs on One Image ��ͼƬ���������µ�ͼ��
#����mfrow: ��һ������ͼƬ���е��������ڶ�������ͼƬ���е�����

par(mfrow = c(2, 3))
hist(numberWhite, main = "firstPlot")
hist(numberChipped, main = "secondPlot")
plot(jitter(numberWhite), jitter(numberChipped), xlab = "Number White Marbles Drawn",
       ylab = "Number Chipped Marbles Drawn", main = "Pulling Marbles With Jitter")
plot(numberWhite, main = "forth plot")
plot(numberChipped, main = "fifth plot")
mosaicplot(table(numberWhite, numberChipped), main = "sixth plot")

#1.5. Density Plots
#ʹ��smoothScatter��������ܶȷֲ�ͼ
numberWhite <- rhyper(30, 4, 5, 3)
numberChipped <- rhyper(30, 2, 7, 3)
par(mfrow(1, 1))
smoothScatter(numberWhite, numberChipped, xlab = "White Marbles", ylab = "Chipped Marbles", main = "Drawing Marbles")

grid(4, 3) #���ܶ�ͼ����3��4�еķָ����������ҵ���Ҫ�ĵ�


#1.6 Pairwise Relationships һ���Ի��ƴ����Ĺ�ϵ
uData <- rnorm(20)
vData <- rnorm(20, mean = 5)
wData <- uData + 2 * vData + rnorm(20, sd = 0.5)
xData <- -2 * uData + rnorm(20, sd = 0.1)
yData <- 3 * vData + rnorm(20, sd = 2.5)
d <- data.frame(u = uData, v = vData, w = wData, x = xData, y = yData)
pairs(d)

#1.7 Shaded Regions :����һ��������ʹ��polygon���������Χ��������Ӱ��
x = c(-1, 1, 1, -1, -1)
y = c(-1, -1, 1, 1, -1)
plot(x, y)
polygon(x, y, col = 'blue')

#####����һ�������ʷֲ���������ͼ
stdDev <- 0.75;
x <- seq(-5, 5, by = 0.01)
y <- dnorm(x, sd = stdDev)
right <- qnorm(0.95, sd = stdDev)
plot(x, y, type = "l", xaxt = "n", ylab = "p",
       xlab = expression(paste('Assumed Distribution of ', bar(x))),
       axes = FALSE, ylim = c(0, max(y) * 1.05), xlim = c(min(x), max(x)),
frame.plot = FALSE)
#####����ʣ�µ��ᣬȻ�󻭳���Ӱ
axis(1, at = c(-5, right, 0, 5),
       pos = c(0, 0),
       labels = c(expression(' '), expression(bar(x)[cr]), expression(mu[0]), expression(' '))) #x�ᣬ�˴���expression��������дϣ����ĸ���±�
axis(2) #y��
xReject <- seq(right, 5, by = 0.01)
yReject <- dnorm(xReject, sd = stdDev)
polygon(c(xReject, xReject[length(xReject)], xReject[1]),
          c(yReject, 0, 0), col = 'red')

#1.8 Plotting a Surface��persp ����
x <- seq(0, 2 * pi, by = pi / 100)
y <- x
xg <- (x * 0 + 1) %*% t(y)
yg <- (x) %*% t(y * 0 + 1) # %*% �������о���˷�
f <- sin(xg + yg)
persp(x, y, f, theta = -10, phi = 40) #���Ƴ�һ��3Dͼ�εı���


#2 Discrete Data ��ɢ����
#2.1 BarPlot ����ͼ
numberWhite <- rhyper(30, 4, 5, 3)

numberWhite <- as.factor(numberWhite) #cast the data as factors and ensures that R treats it as discrete data. 

plot(numberWhite)
######
numberWhite <- rhyper(30, 4, 5, 3)
totals <- table(numberWhite)
totals
barplot(totals, main = "Number Draws", ylab = "Frequency", xlab = "Draws")
######
rownames(totals) <- c("none", "one", "two", "three") #Ϊÿһ������
barplot(totals, main = "Number Draws", ylab = "Frequency", xlab = "Draws")

barplot(sort(totals, decreasing = TRUE), main = "Number Draws", ylab = "Frequency", xlab = "Draws") #�����ɸߵ�������

#������Ϊ��Ϊ������������
totals
totals[c(3, 2, 1, 4)] #������ԭ�����ݵĵ�3λ����2λ����1λ����4λ��

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
                      ) #������һ������ĵ����¼��
par(mfrow = c(2, 2)) #�������ĸ�ͼ����һ��
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

#ʹ��һ����ά�����ֶ��ı���е�λ��
totals[c(2, 1), c(2, 3, 1)]

#3 miscellaneous option ����ѡ��
#3.1 Multiple Representation On One Plot
x = rexp(20, rate = 4)
hist(x, ylim = c(0, 18), main = "This Is An Histogram", xlab = "X")
boxplot(x, at = 16, horizontal = TRUE, add = TRUE)
rug(x, side = 1)
d = density(x)
points(d, type = 'l', col = 3)


#3.2 Multiple Windows
#create different plots on different devices
#���������µ��豸
dev.new()
dev.new()
dev.new()

dev.list() #��������õ��б�
dev.set(3) #xѡȡ���е�һ��
x = rnorm(20)
hist(x)

dev.set(4) #ѡȡһ���豸���
qqnorm(x)
qqline(x)

#3.3 Print To A File 
x = rnorm(100)
hist(x)
dev.print(device = png, width = 200, "hist.png") #ע��ʹ��dev.set�����л���ide�²��ܽ��д�ӡ

#3.4 Annotation and Formatting ע�����ʽ
x <- rnorm(10, mean = 0, sd = 4)

y <- 3 * x - 1 + rnorm(10, mean = 0, sd = 2)

summary(y)

plot(x, y, axes = FALSE, col = 2)

axis(1, pos = c(0, 0), at = seq(-7, 5, by = 1))
axis(2, pos = c(0, 0), at = seq(-18, 11, by = 1))#at ��������ָ���̶�
#######
x <- rnorm(10, mean = 0, sd = 4)

y <- 3 * x - 1 + rnorm(10, mean = 0, sd = 2)

plot(x, y, bty = "7")#ͨ���޸�bty��ʹͼ�λ�ò�ͬ�ı߿�
plot(x, y, bty = "n")

box(lty = 3) #box����Ҳ�����������ñ߿򣬴�ʱ��Ӧ�ı�Ϊ����

#######���趨�������ٻ�����Ӧ��ͼ��
par(bty = "l") #�м������ĸl;
par(bg = "gray")
par(mex = 2)
x <- rnorm(10, mean = 0, sd = 4)
y <- 3 * x - 1 + rnorm(10, mean = 0, sd = 2)
plot(x, y)

#######plot������ͼ�Ϸ����ֶ�:text����
x <- rnorm(10, mean = 0, sd = 4)
y <- 3 * x - 1 + rnorm(10, mean = 0, sd = 2)
plot(x, y)
text(-1,-2,"numbers")
#
text(-7,-2,"outside the area",xpd = TRUE)#���������ֳ������Χ����ʾ��Χʱ��xpdʹ�ֶ���Ȼ��������ʾ


