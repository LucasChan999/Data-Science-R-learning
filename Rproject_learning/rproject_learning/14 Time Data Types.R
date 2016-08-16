# Time Data Types 时间数据类型,此处只关注两种： POSIXct and POSIXlt 
# Contents:
#   Time and Date Variables
#   Time Operations

#1 Time and Date Variables

#POSIXct data type： the number of seconds since the start of January 1, 1970.
#POSIXlt data type： a vector

help(DateTimeClasses)
# To get the current time  -- the Sys.time() 
t <- Sys.time() 

t # "2016-07-29 14:39:43 CST" 

cat(t, "\n") # 1469774383   

c <- as.POSIXct(t) # double type

c #  "2016-07-29 14:39:43 CST"

cat(c, "\n") #1469774383        

l <- as.POSIXlt(t) # list type

l # "2016-07-29 14:39:43 CST"

cat(l, "\n") # 无法执行此操作 

names(l)  # NULL names(c) 也是NULL

l[[1]] #43.41805

l[[2]] # 39

# . . . .
l[[9]] # 0

l[[10]] # "CST"
l[[11]] # 28800,l[[12]]  就没有了

################
# strftime ：used to take a string and convert it into a form that R can use for calculations
help(strftime)

t <- Sys.time() # "2016-07-29 15:00:13 CST"

timeStamp <- strftime(t, "%Y-%m-%d %H:%M:%S") # 转换为字符串格式: "2016-07-29 15:00:13"

typeof(timeStamp) # "character"

myData <- data.frame(time = c("2014-01-23 14:28:21", "2014-01-23 14:28:55",
                              "2014-01-23 14:29:02", "2014-01-23 14:31:18"),
                      speed = c(2.0, 2.2, 3.4, 5.5))

myData

summary(myData)

myData$time[1] #除了本身第一行的信息外 还有总的时间信息“4 Levels: 2014-01-23 14:28:21 2014-01-23 14:28:55 ... 2014-01-23 14:31:18”

typeof(myData$time[1]) # inerger

myData$time <- strptime(myData$time, "%Y-%m-%d %H:%M:%S")

myData

myData$time[1] # 上面转换为character后，只有第一行的信息了

typeof(myData$time[1]) #list

myData$time[1][[2]] # 28

N = length(myData$time) # 4 

myData$time[2:N] - myData$time[1:(N - 1)]

#日期数据类型 Date Data Type
theDates <- c("1 jan 2012", "1 jan 2013", "1 jan 2014") # character
 
dateFields <- as.Date(theDates, "%d %b %Y") 

typeof(dateFields)  # double

dateFields # ?? 结果： NA NA NA 

diff <- dateFields[1:(N - 1)] - dateFields[2:N]

diff

#根据相差的天数和初始日期算出结果日期
infamy <- as.Date(-179, origin = "1994-03-22") # "1993-09-24"

today <- Sys.Date() #now

today - infamy

a <- today - infamy #double

#####
theTime <- Sys.time()

a <- rexp(1, 0.1)

cat("At about", format(theTime, "%H:%M"), "the time between occurrences was around", format(a, digits = 3), "seconds\n")

#2 Time Operations 时间操作
now <- Sys.time()
now # "2016-07-29 16:05:48 CST"

now - 60 # 减去的时间单位为秒

earlier <- strptime("2000-01-01 00:00:00", "%Y-%m-%d %H:%M:%S")
later <- strptime("2000-01-01 00:00:20", "%Y-%m-%d %H:%M:%S")

later - earlier # Time difference of 20 secs

as.double(later - earlier)

earlier <- strptime("2000-01-01 00:00:00", "%Y-%m-%d %H:%M:%S")
later <- strptime("2000-01-01 01:00:00", "%Y-%m-%d %H:%M:%S")

later - earlier # Time difference of 1 hours

up <- as.Date("1961-08-13")
down <- as.Date("1994-03-29")

down - up


#difftime : 显示相差时间 ;单位为能用到的最大单位
earlier <- strptime("2000-01-01 00:00:00", "%Y-%m-%d %H:%M:%S")
later <- strptime("2000-01-01 01:00:00", "%Y-%m-%d %H:%M:%S")

difftime(later, earlier) # Time difference of 1 hours

difftime(later, earlier, units = "secs") # Time difference of 3600 secs, 亦可以设定单位!!!!
# difftime的结果为double

# 使用as.difftime 来计算时间差
diff <- as.difftime("00:30:00", "%H:%M:%S", units = "hour")

diff # The difference of 0.5 hours

now <- Sys.time()

later <- now + diff #"2016-07-29 16:50:57 CST"

if (now < later) {
    cat("there you go\n")
}

#结果为 There you go 
