# Two Way Tables 双向表
# Contents :
#   Creating a Table from Data
#   Creating a Table Directly
#   Tools For Working With Tables
#   Graphical Views of Tables


#1 Creating a Table from Data
smokerData <- read.csv("smoker.csv", header = T,sep = ",")

summary(smokerData)

   #使用table创建一个双向表
smoke <- table(smokerData$Smoke, smokerData$SES) #根据这两个属性创建一个二维的表

smoke

#2  Creating a Table Directly 
smoke <- matrix(c(51, 43, 22, 92, 28, 21, 68, 22, 9), ncol = 3, byrow = TRUE) # ncol 设置当前的列数 ; byrow 为true,按照行来填满
colnames(smoke) <- c("High", "Low", "Middle") #官网这写错了
rownames(smoke) <- c("current","former","never")
smoke <- as.table(smoke)


#3 Tools For Working With Tables
  #1)
barplot(smoke, legend = T, beside = T, main = 'Smoking Status by SES') #续
plot(smoke, main = "Smoking Status By Socioeconomic Status") #

#2）统计所有的观测次数
margin.table(smoke)

margin.table(smoke, 1) #按列统计

margin.table(smoke, 2) #按行统计

#3）组合使用命令:查看所有统计数所占比例

smoke / margin.table(smoke)

margin.table(smoke, 1) / margin.table(smoke)

margin.table(smoke, 2) / margin.table(smoke)

#4) 使用prop.table命令直接实现上面的比例运算
prop.table(smoke) 

prop.table(smoke, 1)

prop.table(smoke, 2)

# 如果想用卡方测试，直接summary就好
summary(smoke) # 根据结果观察： Since the p-value is less that 5% we can reject the null hypothesis at the 95% confidence level
# and can say that the proportions vary.


#4 Graphical Views of Tables 
smokerData <- read.csv("smoker.csv", header = T, sep = ",")

smoke <- table(smokerData$Smoke, smokerData$SES)

mosaicplot(smoke)

mosaicplot(smoke, main = "smokers", xlab = "status", ylab = "economic class") #add titles

mosaiccplot(smoke, sort = c(2, 1)) # use sort to switch whether the width or height is used for the first proportional length

mosaicplot(smoke, dir = c("v", "h")) # use dir to switch which side is used for the vertical and horizontal axis 



