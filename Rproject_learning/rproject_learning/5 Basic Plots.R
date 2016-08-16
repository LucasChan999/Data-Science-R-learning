#Basic Plots基本拟合
w1 <- read.csv(file = "w1.dat", sep = ",", head = TRUE)
names(w1)

tree <- read.csv(file = "trees91.csv",sep = ",",head = TRUE)
names(tree)

#Strip Charts 条形图表
help(stripchart)

stripchart(w1$vals)

stripchart(w1$vals, method = "stack") # see which points are repeated 

stripchart(w1$vals, method = "jitter") # make separation between boxes

stripchart(w1$vals, vertical = TRUE, method = "jitter") # perform it in vertical view

stripchart(w1$vals, method = "stack", main = "Leaf BioMass in High CO2 Environment",xlab = "BioMass of Leaves") #添加标题和横坐标注释

#Histgrams 直方图
hist(w1$vals)
hist(w1$vals, main = "distribution of w1",xlab = "w1")

#设定breaks间隔
hist(w1$vals, breaks = 6)
hist(w1$vals, breaks = 8)
hist(w1$vals, breaks = 10)
hist(w1$vals, breaks = 12)

#使用xlim设定域的大小
hist(w1$vals, breaks = 12, xlim = c(0, 10))
hist(w1$vals, breaks = 12, xlim = c(-1,4))

#change or add a title (will cover on it )
title(main = 'Leaf BioMass in High CO2 Environment', xlab = 'BioMass of Leaves')

hist(w1$vals, main = 'Leaf BioMass in High CO2 Environment', xlab = 'BioMass of Leaves', ylim = c(0, 16))
stripchart(w1$vals, add = TRUE, at = 15.5) #在原来的图的基础上“添加一个新的图表”


#Boxlots箱型图：展示了一个数据集中的中位数 四分位数，最大数，最小数
#依次数下来的五条线;上边缘，上四分位数，中位数，下四分位数，下边缘，（有时存在的一个小圆圈：异常值）
boxplot(w1$vals)

boxplot(w1$vals,
          main = 'Leaf BioMass in High CO2 Environment',
          ylab = 'BioMass of Leaves') #add titles

help(boxplot)

hist(w1$vals, main = 'Leaf BioMass in High CO2 Environment', xlab = 'BioMass of Leaves', ylim = c(0, 16))
boxplot(w1$vals, horizontal = TRUE, at = 15.5, add = TRUE, axes = FALSE) #axes确定是否要在图形边缘加边线

##三种类型的图表 合集
hist(w1$vals, main = 'Leaf BioMass in High CO2 Environment', xlab = 'BioMass of Leaves', ylim = c(0, 16))

boxplot(w1$vals, horizontal = TRUE, at = 16, add = TRUE, axes = FALSE)

stripchart(w1$vals, add = TRUE, at = 15)

tree <- read.csv(file = "trees91.csv", sep = ",", head = TRUE)
tree$C <- factor(tree$C)
tree$N <- factor(tree$N)

boxplot(tree$STBM,
          main='Stem BioMass in Different CO2 Environments',
          ylab='BioMass of Stems') #出现了异常值


#plot a separate box plot for each level
boxplot(tree$STBM ~ tree$C) #按照C啦分类 有四种类型的树 依次画出四个STBM图


#Scatter Plots 散布图
plot(tree$STBM, tree$LFBM)

cor(tree$STBM, tree$LFBM) #相关度 :0.9115949

plot(tree$STBM, tree$LFBM,
       main = "Relationship Between Stem and Leaf Biomass",
       xlab = "Stem Biomass",
       ylab = "Leaf Biomass")


#Normal QQ Plots 正太分位数图 ：determine if your data is close to being normally distributed 判断你的的数据是否逼近正太分布

qqnorm(w1$vals)

qqnorm(w1$vals,
         main = "Normal Q-Q Plot of the Leaf Biomass",
         xlab = "Theoretical Quantiles of the Leaf Biomass",
         ylab = "Sample Quantiles of the Leaf Biomass")

qqline(w1$vals)