# S4 Classes 

#Conents



#1 Basic Ideas
# Create the first quadrant class

# 创建一个FirstQuadrant类
FirstQuadrant <- setClass(
    #set the name class 
    "FirstQuadrant",

    #define the slots
    slots = c(x = "numeric",
          y = "numeric",
          ),
    #set the default values for the slots 
    prototype = c(
                 x = 0.0,
                 y = 0.0),
     # Make a function that can test to see if the data is consistent.
     # This is not called if you have an initialize function defined! 
     validity = function(object) {
         if ((object@x < 0) || (object@y < 0)) {
             return("A negetive number for one of the coordinates was given")
         }
         return(TRUE)
     }
    )

#注意上面访问object的数据元素使用的是 @ 符号
x <- FirstQuadrant()
x # 默认的x y参数是0

y <- FirstQuadrant(x = 5,y = 7)
y # 输入参数的创建

x@y #5 

y@x #7  


Z <- FirstQuadrant(x = 3, y = -2)
#会报错提示 A negative number for one of the coordinates was given.

#创建一个可以给坐标赋值的函数
setGeneric(name = "setGeneric", def = function(theObject, xval, yval) {
                   standardGeneric("setCoordinate")         
         }
         )

setMethod(f = "setCoordinate", signature = "FirstQuaferant", definition = function(theObject, xval, yval) {
    theObject@x <- xval
    theObject@y <- yval
    return (theObject)
}
)

####################################################################################################
#2 Creating an S4 Class:主要还介绍了一些有用的命令

#创建一个基本的Agent类

Agent <- setClass(
    #set the name
"Agent",
    #define the slots
slots = c(location = "numeric", velocity = "numeric", active = "logical"),
   #set the default values for the slots.(optional)
prototype = list(location = c(0.0, 0.0), active = TRUE, velocity = c(0.0, 0.0)),
   # Make a function that can test to see if the data is consistent.
   # This is not called if you have an initialize function defined!
 validity = function(object) {
     if (sum(object@velocity ^ 2) > 100.0) {
         return("The velocity level is out of bounds.")
     }
     return(TRUE)
 }
)


#试着创建一个Agent类
a <- Agent()
a

#判断a,先判断是不是object 再判断是不是S4
is.object(a)

isS4(a)

#slotname 命令:returns the names of the slots associated with the class as strings.
slotNames(a)

slotNames("Agent")

#getSlots 命令:返回类里面定义的数据名称和类型
getSlots("Agent")

s<- get("Agent")
s[1] #显示第一个数据类型名location 以及它的类型 "numeric"

names(s)

#getClass命令 ： 有两种用法
# 第一种： 输入一个是S4类的变量a ，返回 类里定义的slots变量名 及默认值
getClass(a)

#第二种 ： 输入类型名 ，返回slots变量名及对应的数据类型
getClass("Agent") 

#slot命令：获取和修改object的slot参数值
slot(a,"location")

slot(a, "location") <- c(1, 5)

###################################################################################
#3 创建方法method:都是一对对的创建类的方法
# create a method to assign the value of the location
setGeneric(name = "setLocation",
                       def = function(theObject, position) {
                           standardGeneric("setLocation")
                       }
                       )

setMethod(f = "setLocation",
                      signature = "Agent",
                      definition = function(theObject, position) {
                          theObject@location <- position
                          validObject(theObject)
                          return(theObject)
                      }
                      )

# create a method to get the value of the location
setGeneric(name = "getLocation",
                       def = function(theObject) {
                           standardGeneric("getLocation")
                       }
                       )

setMethod(f = "getLocation",
                      signature = "Agent",
                      definition = function(theObject) {
                          return(theObject@location)
                      }
                      )


# create a method to assign the value of active
setGeneric(name = "setActive",
                       def = function(theObject, active) {
                           standardGeneric("setActive")
                       }
                       )

setMethod(f = "setActive",
                      signature = "Agent",
                      definition = function(theObject, active) {
                          theObject@active <- active
                          validObject(theObject)
                          return(theObject)
                      }
                      )

# create a method to get the value of active
setGeneric(name = "getActive",
                       def = function(theObject) {
                           standardGeneric("getActive")
                       }
                       )

setMethod(f = "getActive",
                      signature = "Agent",
                      definition = function(theObject) {
                          return(theObject@active)
                      }
                      )


# create a method to assign the value of velocity
setGeneric(name = "setVelocity",
                       def = function(theObject, velocity) {
                           standardGeneric("setVelocity")
                       }
                       )

setMethod(f = "setVelocity",
                      signature = "Agent",
                      definition = function(theObject, velocity) {
                          theObject@velocity <- velocity
                          validObject(theObject)
                          return(theObject)
                      }
                      )

# create a method to get the value of the velocity
setGeneric(name = "getVelocity",
                       def = function(theObject) {
                           standardGeneric("getVelocity")
                       }
                       )

setMethod(f = "getVelocity",
                      signature = "Agent",
                      definition = function(theObject) {
                          return(theObject@velocity)
                      }
                      )




# create a method to reset the velocity and the activity
setGeneric(name = "resetActivity",
                       def = function(theObject, value) {
                           standardGeneric("resetActivity")
                       }
                       )

setMethod(f = "resetActivity",
                      signature = c("Agent", "logical"),
                      definition = function(theObject, value) {
                          theObject <- setActive(theObject, value)
                          theObject <- setVelocity(theObject, c(0.0, 0.0))
                          return(theObject)
                      }
                      )

setMethod(f = "resetActivity",
                      signature = c("Agent", "numeric"),
                      definition = function(theObject, value) {
                          theObject <- setActive(theObject, TRUE)
                          theObject <- setVelocity(theObject, value)
                          return(theObject)
                      }
                      )


#4 继承Inheritance
#Prey
Prey <- setClass(
    #set name 
"Prey",
    #define slots
slots = character(0),
    #set default values for slots(optional)
   prototype = list(),
       # Make a function that can test to see if the data is consistent. 测试部分
        # This is not called if you have an initialize function defined!
validity = function(object) {
    if (sum(object@velocity ^ 2) > 70.0) {
        return("The velocity level is out of bounds.")
    }
    return(TRUE)
},
   # 继承
   contains = "Agent"

    )

#Bobcat
Bobcat <- setClass(
        # Set the name for the class
        "Bobcat",

        # Define the slots - in this case it is empty...
        slots = character(0),

        # Set the default values for the slots. (optional)
        prototype = list(),

        # Make a function that can test to see if the data is consistent.
        # This is not called if you have an initialize function defined!
        validity = function(object) {
            if (sum(object@velocity ^ 2) > 85.0) {
                return("The velocity level is out of bounds.")
            }
            return(TRUE)
        },

        # Set the inheritance for this class
        contains = "Agent"
        )


#Lynx : 又继承自Bobcat ,直接在最后的contains部分修改就行了
Lynx <- setClass(
        # Set the name for the class
        "Lynx",

        # Define the slots - in this case it is empty...
        slots = character(0),

        # Set the default values for the slots. (optional)
        prototype = list(),

        # Make a function that can test to see if the data is consistent.
        # This is not called if you have an initialize function defined!
        validity = function(object) {
            if (sum(object@velocity ^ 2) > 95.0) {
                return("The velocity level is out of bounds.")
            }
            return(TRUE)
        },

        # Set the inheritance for this class
        contains = "Bobcat"
        )

#为新的继承类写一个方法： move
setGeneric(name = "move", def = function(object) {standardGeneric("move") })

setMethod(f = "move", signature = "Agent", definition = function(theObject) {
    print("Move this Agent dude")
    theObject <- setVelocity(theObject, c(1, 2))
    validObject(theObject)
    return(theObject)
})
#分别对应三个不同的类的方法 method

setMethod(f = "move",
                      signature = "Prey",
                      definition = function(theObject) {
                          print("Check this Prey before moving this dude")
                          theObject <- callNextMethod(theObject)
                          print("Move this Prey dude")
                          validObject(theObject)
                          return(theObject)
                      }
                      )

setMethod(f = "move",
                      signature = "Bobcat",
                      definition = function(theObject) {
                          print("Check this Bobcat before moving this dude")
                          theObject <- setLocation(theObject, c(2, 3))
                          theObject <- callNextMethod(theObject)
                          print("Move this Bobcat dude")
                          validObject(theObject)
                          return(theObject)
                      }
                      )

setMethod(f = "move",
                      signature = "Lynx",
                      definition = function(theObject) {
                          print("Check this Lynx before moving this dude")
                          theObject <- setActive(theObject, FALSE)
                          theObject <- callNextMethod(theObject)
                          print("Move this Lynx dude")
                          validObject(theObject)
                          return(theObject)
                      }
                      )


















