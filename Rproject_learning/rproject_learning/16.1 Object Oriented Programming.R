#Object Oriented Programming ���������

#16.1. S3 Classes 
#Contents
#  The Basic Idea
#  Memory Management
#  Creating an S3 Class��
#     Straight Forward Approach
#     Local Environment Approach
#  Creating Methods��
#     Straight Forward Approach
#     Local Environment Approach
#  Inheritance

#1�� The Basic Ideas
#ʹ�� class �����趨 �� ����

p <- c(1, 2, 3)
class(p) # numeric 

class(p) <- append(class(p), "Flamboyancy") # ����Flamboyancy����

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

# environment() ������ȡ���»����ռ��ָ��
e <- environment()

assign("p", 3, e)

ls()

p # 3

get("p",e) #������ָ��p��ָ�룬����e��ֵ����p��ֵ��3

#3 Creating a S3 class  ����һ��S3��
#1)  Straight Forward Approach ֱ�ӷ���

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

budda <- NorthAmerican() #ֱ��ʹ����������

budda$hasBreakfast # TRUE 

louise <- NorthAmerican(eatsBreakfast = TRUE, myFavorite = "fried eggs") # ���ַ�ʽ����

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
    ## Ϊ��ǰ�����ڵ�list������ֵ
    assign('this', me, envir = thisEnv)

    ## Ϊ���������
    class(me) <- append(class(me), "NordAmericain")
    return(me)
}

budda <- NordAmerican()

get("hasBreakfast", budda$getEnv())

get("favoritefood", budda$getEnv())
##
budda$getEnv() # <environment: 0x000000a9fb311fe0> ��ȡ��������ֵ

budda <- NordAmerican(myfavorite = "oatmeal")

get("favoritefood", budda$getEnv()) 
####
louise <- bubba # ��budda���Ƶ�louise ��������budda��ָ�룬����louiseҲ��ָ��

assign("favoritefood", "toast", louise$getEnv())

get("favoritefood", louise$getEnv())

get("favoriteBreakfast", bubba$getEnv())


#4 Creating Methods ��������
#1�� Straight Forward Method 
######����hasBreakfast��һ���Եĺ���
setHasBreakfast <- function(elObjeto, newValue) {
    print("Calling the base setHasBreakfast function")
    UseMethod("setHasBreakfast", elObjeto) # ʹ��UseMethod����Rȥ��Ѱ��ȷ��function  
    print("Note this is not executed!") #��һ��û�б�ִ��
}

setHasBreakfast.default <- function(elObjeto, newValue) {
    print("You screwed up. I do not know how to handle this object.") 
    return(elObjeto) 
}

setHasBreakfast.NorthAmerican <- function(elObjeto, newValue) {
    print("In setHasBreakfast.NorthAmerican and setting the value")
    elObjeto$hasBreakfast <- newValue # ���µ�ֵ������ elObjeto
    return(elObjeto)
}

# 
bubba <- NorthAmerican() #����

bubba$hasBreakfast # TRUE����ʼֵΪTRUE��ʹ��tHasBreakfast.NorthAmerican

bubba <- setHasBreakfast(bubba, FALSE)
#"Calling the base setHasBreakfast function"
#"In setHasBreakfast.NorthAmerican and setting the value"

bubba$hasBreakfast
# FALSE��

bubba <- setHasBreakfast(bubba, "No type checking sucker!") #����仰��Ϊֵ���룬ʹ��tHasBreakfast.NorthAmerican
#"Calling the base setHasBreakfast function"
# "In setHasBreakfast.NorthAmerican and setting the value"

bubba$hasBreakfast #  "No type checking sucker!"

#���޷��ҵ���ȷ�ĺ���ʱ��ʹ��ʹ��tHasBreakfast.default,���磺
someNumbers <- 1:4 # 1 2 3 4 

someNumbers <- setHasBreakfast(someNumbers, "what?")
# "Calling the base setHasBreakfast function"
# "You screwed up. I do not know how to handle this object."

######��ȡhasBreakfast��һ���Եĺ���
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

##���������get����
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

    ## Define the accessors for the data fields. �����˶���������Ľӿ�
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
#��������ĺ������
budda <- NorthAmerican(myFavorite = "pork")

budda$getFavoriteBreakfast() # pork

budda$setHasBreakfast(FALSE)

budda$getHasBreakfast() #FALSE

####### ��ʹ�ñ��ػ������ʱ���ڸ��Ƶ�ʱ����������
#��д��ֵ���� ��������ȷ����һ���������Ƶĺ���
makeCopy <- function(elObjeto) {
    print("Calling the base makeCopy function")
    UseMethod("makeCopy", elObjeto)
    print("Note this is not executed!")
}

makeCopy.default <- function(elObjeto) { #����ʧ��
    print("You screwed up. I do not know how to handle this object.")
    return(elObjeto)
}


makeCopy.NorthAmericain <- function(elObjeto) { #���и���
    print("In makeCopy.NordAmericain and making a copy")
    newObject <- NorthAmerican(
                        eatsBreakfast = elObjeto$getHasBreakfast(),
                        myFavorite = elObjeto$getFavoriteBreakfast())
    return(newObject)
}

#������������в���

budda <- NorthAmerican()

buddaCopy <- makeCopy.NorthAmericain(budda)

buddaCopy

# 5 Inheritance �̳�
#����������s3Inheritane.R�ű��ű�����