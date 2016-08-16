#Object Oriented Programming 面向对象编程

#16.1. S3 Classes 
#Contents
#  The Basic Idea
#  Memory Management
#  Creating an S3 Class：
#     Straight Forward Approach
#     Local Environment Approach
#  Creating Methods：
#     Straight Forward Approach
#     Local Environment Approach
#  Inheritance

#1） The Basic Ideas
#使用 class 命令设定 类 属性

p <- c(1, 2, 3)
class(p) # numeric 

class(p) <- append(class(p), "Flamboyancy") # 添加Flamboyancy属性

class(p) # numberic Flamboyancty 

####
p <- list(first = "one", second = "two", third = "third")

class(p) <- append(class(p), "Flamboyancy")

GetFirst <- function(x) {
     
    UseMethod("GetFirst",x)

}


GetFirst.Flamboyancy <- function(x) {

    return(x$first)

}

GetFirst(p) #GetFirst(p) #

#1.2 Memory Management

ls()

# environment() 用来获取当下环境空间的指针
e <- environment()

assign("p", 3, e)

ls()

p # 3

get("p",e) #由于是指向p的指针，所以e的值就是p的值：3

#3 Creating a S3 class  创建一个S3类
#1)  Straight Forward Approach 直接方法

NorthAmerican <- function(eatsBreakfast=TRUE,myFavorite="cereal")
{

        me <- list(
                hasBreakfast = eatsBreakfast,
                favoriteBreakfast = myFavorite
       )

        ## Set the name for the class
        class(me) <- append(class(me),"NorthAmerican")
        return(me)
}

budda <- NorthAmerican() #直接使用类来创建

budda$hasBreakfast # TRUE 

louise <- NorthAmerican(eatsBreakfast = TRUE, myFavorite = "fried eggs") # 换种方式声明

louise$favoriteBreakfast #fried eggs 

louise$hasBreakfast #TRUE

#2) Local Environment Approach

NordAmerican <- function(eatsbreakfast = TRUE ,myfavorite = "cereal") {

    thisEnv <- environment()

    hasBreakfast = eatsbreakfast
    favoritefood = myfavorite

    me <- list(

    thisEnv = thisEnv, 
    
    getEnv = function() {
        return(get("thisEnv", thisEnv))
    }
    )
    ## 为当前环境内的list变量赋值
    assign('this', me, envir = thisEnv)

    ## 为这个类命名
    class(me) <- append(class(me), "NordAmericain")
    return(me)
}

budda <- NordAmerican()

get("hasBreakfast", budda$getEnv())

get("favoritefood", budda$getEnv())
##
budda$getEnv() # <environment: 0x000000a9fb311fe0> 获取环境变量值

budda <- NordAmerican(myfavorite = "oatmeal")

get("favoritefood", budda$getEnv()) 
####
louise <- bubba # 将budda复制到louise 但是由于budda是指针，所以louise也是指针

assign("favoritefood", "toast", louise$getEnv())

get("favoritefood", louise$getEnv())

get("favoriteBreakfast", bubba$getEnv())


#4 Creating Methods 创建方法
#1） Straight Forward Method 
######设置hasBreakfast这一属性的函数
setHasBreakfast <- function(elObjeto, newValue) {
    print("Calling the base setHasBreakfast function")
    UseMethod("setHasBreakfast", elObjeto) # 使用UseMethod告诉R去搜寻正确的function  
    print("Note this is not executed!") #这一行没有被执行
}

setHasBreakfast.default <- function(elObjeto, newValue) {
    print("You screwed up. I do not know how to handle this object.") 
    return(elObjeto) 
}

setHasBreakfast.NorthAmerican <- function(elObjeto, newValue) {
    print("In setHasBreakfast.NorthAmerican and setting the value")
    elObjeto$hasBreakfast <- newValue # 将新的值赋给对 elObjeto
    return(elObjeto)
}

# 
bubba <- NorthAmerican() #创建

bubba$hasBreakfast # TRUE，初始值为TRUE，使用tHasBreakfast.NorthAmerican

bubba <- setHasBreakfast(bubba, FALSE)
#"Calling the base setHasBreakfast function"
#"In setHasBreakfast.NorthAmerican and setting the value"

bubba$hasBreakfast
# FALSE　

bubba <- setHasBreakfast(bubba, "No type checking sucker!") #将这句话作为值输入，使用tHasBreakfast.NorthAmerican
#"Calling the base setHasBreakfast function"
# "In setHasBreakfast.NorthAmerican and setting the value"

bubba$hasBreakfast #  "No type checking sucker!"

#当无法找到正确的函数时，使用使用tHasBreakfast.default,例如：
someNumbers <- 1:4 # 1 2 3 4 

someNumbers <- setHasBreakfast(someNumbers, "what?")
# "Calling the base setHasBreakfast function"
# "You screwed up. I do not know how to handle this object."

######获取hasBreakfast这一属性的函数
getHasBreakfast <- function(elObjeto) {
    print("Calling the base getHasBreakfast function")
    UseMethod("getHasBreakfast", elObjeto)
    print("Note this is not executed!")
}

getHasBreakfast.default <- function(elObjeto) {
    print("You screwed up. I do not know how to handle this object.")
    return(NULL)
}

getHasBreakfast.NorthAmerican <- function(elObjeto) {
    print("In getHasBreakfast.NorthAmerican and returning the value")
    return(elObjeto$hasBreakfast)
}

##测试上面的get函数
budda <- NorthAmerican()
budda <- setHasBreakfast(budda,"No suck food ")

result <- getHasBreakfast(budda)

result

#2)  Local Environment Approach

NorthAmerican <- function(eatsBreakfast = TRUE, myFavorite = "cereal") {

    thisEnv <- environment()

    hasBreakfast <- eatsBreakfast
    favoriteBreakfast <- myFavorite

    me <- list(

    thisEnv = thisEnv,

    ## Define the accessors for the data fields. 定义了对于数据域的接口
     getEnv = function() {
         return(get("thisEnv", thisEnv))
     },

              getHasBreakfast = function() {
                  return(get("hasBreakfast", thisEnv))
              },

              setHasBreakfast = function(value) {
                  return(assign("hasBreakfast", value, thisEnv))
              },


              getFavoriteBreakfast = function() {
                  return(get("favoriteBreakfast", thisEnv))
              },

              setFavoriteBreakfast = function(value) {
                  return(assign("favoriteBreakfast", value, thisEnv))
              }
    )

    assign('this', me, envir = thisEnv)

    ## Set the name for the class
    class(me) <- append(class(me), "NorthAmerican")
    return(me)

}
#测试上面的函数语句
budda <- NorthAmerican(myFavorite = "pork")

budda$getFavoriteBreakfast() # pork

budda$setHasBreakfast(FALSE)

budda$getHasBreakfast() #FALSE

####### 当使用本地环境类的时候，在复制的时候会出现问题
#编写赋值函数 ，必须明确声明一个用来复制的函数
makeCopy <- function(elObjeto) {
    print("Calling the base makeCopy function")
    UseMethod("makeCopy", elObjeto)
    print("Note this is not executed!")
}

makeCopy.default <- function(elObjeto) { #复制失败
    print("You screwed up. I do not know how to handle this object.")
    return(elObjeto)
}


makeCopy.NorthAmericain <- function(elObjeto) { #进行复制
    print("In makeCopy.NordAmericain and making a copy")
    newObject <- NorthAmerican(
                        eatsBreakfast = elObjeto$getHasBreakfast(),
                        myFavorite = elObjeto$getFavoriteBreakfast())
    return(newObject)
}

#对上面的语句进行测试

budda <- NorthAmerican()

buddaCopy <- makeCopy.NorthAmericain(budda)

buddaCopy

# 5 Inheritance 继承
#具体内容在s3Inheritane.R脚本脚本里面
