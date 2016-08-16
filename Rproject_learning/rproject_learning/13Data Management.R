#Data Management  :assembling different data sets into more convenient forms
# Contents:
#  Appending Data
#  Applying Functions Across Data Elements

# 1 Appending Data
# 使用rbind 和 cbind对数据进行按行和按列的组合

a <- data.frame(one = c(0, 1, 2), two = c("a", "a", "b"))
b <- data.frame(one = c(10, 11, 12), two = c("c", "c", "d"))

v <- rbind(a, b)
typeof(v) #list

w <- cbind(a, b)
typeof(w) #list

names(w) = c("one", "two", "three", "four") # 列名由“one two onw two”变化为“one two three four ”


#2 Applying Functions Across Data Elements
# 处理数据的子集数据时，使用apply函数十分有效

 #1）operations on lists and vectors 
    # the lapply command is used to take a list of items and perform some function on each member of the list
x <- list(a = rnorm(200, mean = 1, sd = 10),
            b = rexp(300, 10.0),
            c = as.factor(c("a", "b", "b", "b", "c", "c")))

lapply(x, summary) #对a,b,c分别进行总结

    # sapply function is similar, but the difference is that it tries to turn the result into a vector or matrix if possible
x <- list(a = rnorm(8, mean = 1, sd = 1),
            b = rexp(10 , 10.0))

x

val <- lapply(x, mean) #list
val$a #对应下面的other[1],内容相同
val$b

other <- sapply(x, mean) # double
other[1] 
other[2]

    #2） Operations By Factors 
val <- data.frame(a = c(1, 2, 10, 20, 5, 50),
                    b = as.factor(c("a", "a", "b", "b", "a", "b")))
     
val

#apply the function to each subset of the data that matches each of the factors
result <- tapply(val$a, val$b, mean) #double类型

result <- tapply(val$a, val$b, summary) # list类型

typeof(result)




