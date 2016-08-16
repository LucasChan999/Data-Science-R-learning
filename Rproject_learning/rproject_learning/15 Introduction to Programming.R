# Introduction to Programming 

# Contents:
#   Executing a file
#   Functions

#1 Executing a file 
#Contents
#   Executing the commands in a File
#   if statements
#   for statements
#   while statements
#   repeat statements
#   break and next statements
#   switch statement
#   scan statement

#1.1executing the commands in a File 
#source('file.R')
help(source)

# 
source('simpleEx.R')

source('simpleEx.R', echo = TRUE)

source('simpleEx.R', print.eval = TRUE)

source('simpleEx.R', verbose = T)

#determine the current directory using the getwd command.
#see what files are in the directory using the dir command

#1.2  if statement 
x <- 0.1
if (x < 0.2) {
    x <- x + 1
    cat("increment that number!\n")
}
# increment that number!



#1.3 for statement
for (lupe in seq(0, 1, by = 0.3)) {
    cat(lupe, "\n");
}
# 一次换行输出 0 0.3 0.6 0.6 

###
x <- c(1, 2, 4, 6, 8, 10)
for (loop in x) {
    cat("value of loop ", loop, '\n')
}


#1.4 while statement
lupe <- 1
x <- 1
while (x < 4) {
    x <- rnorm(1, mean = 3, sd = 2)
    cat("value of x is :", x, " loop times:", lupe, '\n');
    lupe <- lupe + 1
}


#1.5 repeat statements

repeat {
    x <- rnorm(1)
    if (x < -2.0) break
}

#1.6 break and next statements

x <- rnorm(5)
for (lupe in x) {
    if (lupe > 2.0)
        next

        if ((lupe < 0.6) && (lupe > 0.5))
            break

            cat("The value of lupe is ", lupe, "\n");
}


#1.7  switch statement:输出对应下标的数字
x <- as.integer(2)
x

s <- switch(x,1,2,3,4,5)
s

x<- 3.5
z = switch(x, 1, 2, 3, 4, 5)
z # 3

#1.8  scan statement: read input from keyboard ;  returns the value that was typed in.
help(scan)

a <- scan(what = double(0))

a <- scan(what = double(0), nmax = 1, multi.line = FALSE) # 设定只能输入一个值


# 2 Functions 函数 : 最后一行表达式就是返回值 ; 注意函数名的位置
newDef <- function(a, b) {
    x = runif(10, a, b)
    mean(x)
}

newDef(1,1) # 1

# The best rule of thumb is to not put in operations in an argument list if they matter after the function is called.

c = c(1, 2, 3, 4, 5)
sample <- function(a, b) {
    value = switch(a, "median" = median(b), "mean" = mean(b), "variance" = var(b)) # median : 中位数
    largeVals = length(c[c > 1]) #大于1的数有四个，largeVals = 4
    list(stat = value, number = largeVals) #返回的结果
}

result <- sample("median", c)

#由于最后返回的是list 
result$stat
result$number

# Be very careful about the names of variables especially when using functions!!!!


