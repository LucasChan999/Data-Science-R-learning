#Basic Plots�������
w1 <- read.csv(file = "w1.dat", sep = ",", head = TRUE)
names(w1)

tree <- read.csv(file = "trees91.csv",sep = ",",head = TRUE)
names(tree)

#Strip Charts ����ͼ��
help(stripchart)

stripchart(w1$vals)

stripchart(w1$vals, method = "stack") # see which points are repeated 

stripchart(w1$vals, method = "jitter") # make separation between boxes

stripchart(w1$vals, vertical = TRUE, method = "jitter") # perform it in vertical view

stripchart(w1$vals, method = "stack", main = "Leaf BioMass in High CO2 Environment",xlab = "BioMass of Leaves") #���ӱ���ͺ�����ע��

#Histgrams ֱ��ͼ
hist(w1$vals)
hist(w1$vals, main = "distribution of w1",xlab = "w1")

#�趨breaks���
hist(w1$vals, breaks = 6)
hist(w1$vals, breaks = 8)
hist(w1$vals, breaks = 10)
hist(w1$vals, breaks = 12)

#ʹ��xlim�趨��Ĵ�С
hist(w1$vals, breaks = 12, xlim = c(0, 10))
hist(w1$vals, breaks = 12, xlim = c(-1,4))

#change or add a title (will cover on it )
title(main = 'Leaf BioMass in High CO2 Environment', xlab = 'BioMass of Leaves')

hist(w1$vals, main = 'Leaf BioMass in High CO2 Environment', xlab = 'BioMass of Leaves', ylim = c(0, 16))
stripchart(w1$vals, add = TRUE, at = 15.5) #��ԭ����ͼ�Ļ����ϡ�����һ���µ�ͼ����


#Boxlots����ͼ��չʾ��һ�����ݼ��е���λ�� �ķ�λ�������������С��
#������������������;�ϱ�Ե�����ķ�λ������λ�������ķ�λ�����±�Ե������ʱ���ڵ�һ��СԲȦ���쳣ֵ��
boxplot(w1$vals)

boxplot(w1$vals,
          main = 'Leaf BioMass in High CO2 Environment',
          ylab = 'BioMass of Leaves') #add titles

help(boxplot)

hist(w1$vals, main = 'Leaf BioMass in High CO2 Environment', xlab = 'BioMass of Leaves', ylim = c(0, 16))
boxplot(w1$vals, horizontal = TRUE, at = 15.5, add = TRUE, axes = FALSE) #axesȷ���Ƿ�Ҫ��ͼ�α�Ե�ӱ���

##�������͵�ͼ�� �ϼ�
hist(w1$vals, main = 'Leaf BioMass in High CO2 Environment', xlab = 'BioMass of Leaves', ylim = c(0, 16))

boxplot(w1$vals, horizontal = TRUE, at = 16, add = TRUE, axes = FALSE)

stripchart(w1$vals, add = TRUE, at = 15)

tree <- read.csv(file = "trees91.csv", sep = ",", head = TRUE)
tree$C <- factor(tree$C)
tree$N <- factor(tree$N)

boxplot(tree$STBM,
          main='Stem BioMass in Different CO2 Environments',
          ylab='BioMass of Stems') #�������쳣ֵ


#plot a separate box plot for each level
boxplot(tree$STBM ~ tree$C) #����C������ ���������͵��� ���λ����ĸ�STBMͼ


#Scatter Plots ɢ��ͼ
plot(tree$STBM, tree$LFBM)

cor(tree$STBM, tree$LFBM) #��ض� :0.9115949

plot(tree$STBM, tree$LFBM,
       main = "Relationship Between Stem and Leaf Biomass",
       xlab = "Stem Biomass",
       ylab = "Leaf Biomass")


#Normal QQ Plots ��̫��λ��ͼ ��determine if your data is close to being normally distributed �ж���ĵ������Ƿ�ƽ���̫�ֲ�

qqnorm(w1$vals)

qqnorm(w1$vals,
         main = "Normal Q-Q Plot of the Leaf Biomass",
         xlab = "Theoretical Quantiles of the Leaf Biomass",
         ylab = "Sample Quantiles of the Leaf Biomass")

qqline(w1$vals)