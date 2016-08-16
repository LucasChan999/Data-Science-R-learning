#1 Input 
h <- read.csv(file = "simple.csv", head = TRUE, sep = ",")
h
summary(h)
dir() # list the files
getwd() #determine current work diretory

h$trial #seperate the columns and list some of them
h$velocity

names(h) #columns  in the variable

tree <- read.csv(file = "trees91.csv", header = TRUE,sep = ",")
tree

attributes(tree) #see what kind of variable you have

names(tree)
tree$C # first column in tree

a = read.fwf(file = "fixedWidth.dat", widths = c(-17,15, 7), col.names = c("names", "offices"))
a 



