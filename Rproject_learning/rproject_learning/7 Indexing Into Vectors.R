# Indexing Into Vectors 索引向量
#Contents：
# Indexing With Logicals
# Not Available or Missing Values
# Indices With Logical Expression

#1 Indexing with Logicals
a <- c(1, 2, 3, 4, 5)
b <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
a[b] #1 3 5

max(a[b]) #5
sum(a[b]) #9


#2 Not Available or Missing Values
a <- c(1, 2, 3, 4, 5, NA) #NA 缺失数据
sum(a) #NA
sum(a, na.rm = TRUE) #15 :使用na.rm,排除NA对运算的影响

#对NA进行准确的定位
a <- c(1, 2, 3, 4, 5, NA)
is.na(a) # FALSE FALSE FALSE FALSE FALSE  TRUE
!is.na(s) # TRUE  TRUE  TRUE  TRUE  TRUE FALSE
a[!is.na(a)] #1 2 3 4 5
b <- a[!is.na(a)]

#3 Indices With Logical Expression 具有逻辑表达式的索引

a <- c(1,2,3,4,5)

b <- a[a < 4]

b #1 2 3

#根据数据自身逻辑确定条件
a <- data.frame(one = c('a', 'a', 'b', 'b', 'c', 'c'),
                two = c(1,2,3,4,5,6))
both = d$two[(d$one == 'a') | (d$one == 'b')] #选择对应字母为a或b的数字

both #1 2 3 4 

#注意”|“和”||“的区别：
(c(TRUE, TRUE)) | (c(FALSE, TRUE)) # TRUE TRUE

(c(TRUE, TRUE)) || (c(FALSE, TRUE)) #TRUE

(c(TRUE, TRUE)) & (c(FALSE, TRUE)) # FALSE TRUE

(c(TRUE, TRUE)) && (c(FALSE, TRUE)) # FALSE
#& 和 &&同理