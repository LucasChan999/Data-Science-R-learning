# Two Way Tables ˫���
# Contents :
#   Creating a Table from Data
#   Creating a Table Directly
#   Tools For Working With Tables
#   Graphical Views of Tables


#1 Creating a Table from Data
smokerData <- read.csv("smoker.csv", header = T,sep = ",")

summary(smokerData)

   #ʹ��table����һ��˫���
smoke <- table(smokerData$Smoke, smokerData$SES) #�������������Դ���һ����ά�ı�

smoke

#2  Creating a Table Directly 
smoke <- matrix(c(51, 43, 22, 92, 28, 21, 68, 22, 9), ncol = 3, byrow = TRUE) # ncol ���õ�ǰ������ ; byrow Ϊtrue,������������
colnames(smoke) <- c("High", "Low", "Middle") #������д����
rownames(smoke) <- c("current","former","never")
smoke <- as.table(smoke)


#3 Tools For Working With Tables
  #1)
barplot(smoke, legend = T, beside = T, main = 'Smoking Status by SES') #��
plot(smoke, main = "Smoking Status By Socioeconomic Status") #

#2��ͳ�����еĹ۲����
margin.table(smoke)

margin.table(smoke, 1) #����ͳ��

margin.table(smoke, 2) #����ͳ��

#3�����ʹ������:�鿴����ͳ������ռ����

smoke / margin.table(smoke)

margin.table(smoke, 1) / margin.table(smoke)

margin.table(smoke, 2) / margin.table(smoke)

#4) ʹ��prop.table����ֱ��ʵ������ı�������
prop.table(smoke) 

prop.table(smoke, 1)

prop.table(smoke, 2)

# ������ÿ������ԣ�ֱ��summary�ͺ�
summary(smoke) # ���ݽ���۲죺 Since the p-value is less that 5% we can reject the null hypothesis at the 95% confidence level
# and can say that the proportions vary.


#4 Graphical Views of Tables 
smokerData <- read.csv("smoker.csv", header = T, sep = ",")

smoke <- table(smokerData$Smoke, smokerData$SES)

mosaicplot(smoke)

mosaicplot(smoke, main = "smokers", xlab = "status", ylab = "economic class") #add titles

mosaiccplot(smoke, sort = c(2, 1)) # use sort to switch whether the width or height is used for the first proportional length

mosaicplot(smoke, dir = c("v", "h")) # use dir to switch which side is used for the vertical and horizontal axis 


