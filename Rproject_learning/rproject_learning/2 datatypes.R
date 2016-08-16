#numbers
a <- 3

b <- sqrt(a * a + 3)
b

ls() #a list of the variables that you have defined

a <- c(1, 2, 3, 4, 5) #create a list (also called a ¡°vector¡±) 
#vector starts with a[1]

a <- numeric(10) # 10 columns one row,all  zero
tyrpof(a)

#strings
a <- c("hello")
a

b <- c("hello", "there")
b

b[0] # output "character(0)"

character(10) # kind of like numeric while stores string 

#factors
summary(tree$CHBR) #¡°CHBR¡± column are not all numbers,R automatically assumes that it is a factor

tree$C <- factor(tree$C) # tell R to treat the ¡°C¡± column as a set of factors
summary(tree$C)

levels(tree$C) #level the numbers in tree$C


#Data Frames
a <- c(1, 2, 3, 4)
b <- c("a", "b", "c", "d")
levels <- factor(c("A", "B", "C", "D"))
budda <- data.frame(first = a, second = b, f = levels)

budda$first
budda$second
budda$f

#logical
a = TRUE
typeof(a)

a = c(TRUE, FALSE)
b = c(FALSE, FALSE)

a | b
a || b

a = c(1, 2, 3)
is.numeric(a) #determine if a variable is numeric
is.factor(a) #determine if a variable is factor

#Tables

a <- factor(c("A", "A", "B", "A", "B", "B", "C", "A", "C"))
results <- table(a)
results

summary(results)

occur <- matrix(c(2, 3, 4), ncol = 3, byrow = TRUE)
occur

occur <- as.table(occur) #make row name change into "A"
occur

colnames(occur) <- c("A", "B", "C") # make columns names change into "A,B,C,D"
occur

attributes(occur)

a <- c("Sometimes", "Sometimes", "Never", "Always", "Always", "Sometimes", "Sometimes", "Never")
b <- c("Maybe", "Maybe", "Yes", "Maybe", "Maybe", "No", "Yes", "No")
results <- table(a, b)
resuts

sexsmoke <- matrix(c(70, 120, 65, 140), ncol = 2, byrow = TRUE)
rownames(sexsmoke) <- c("male", "female")
colnames(sexsmoke) <- c("smoke", "nosmoke")
sexsmoke <- as.table(sexsmoke)
sexsmoke
