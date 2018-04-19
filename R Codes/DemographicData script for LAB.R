#Download data from canvas (DemographicData.csv)

#---------Load library with packages
lapply(.packages(all.available = TRUE), function(xx) library(xx,     character.only = TRUE))

#---------My First Variable in R
# In R, you can create a variable using <- or = sign. Once we create a variable, you no longer get the output directly (like calculator), unless you call the variable in the next line. Remember, variables can be alphabets, alphanumeric but not numeric. You can’t create numeric variables.
name <- "Username"
name <- "Andrew"
print( name )


#---------Understanding DataTypes in R
#R has various type of ‘data types’ which includes vector (numeric, integer etc), matrices, data frames and list.
# When objects of different classes are mixed in a list, coercion occurs.

qt <- c("Time", 24, "October", TRUE, 3.33) #character
ab <- c(TRUE, 24) #numeric
cd <- c(2.5, "May") #character
       
#To check the class of any object, use class(“vector name”) function.
class(qt)
       
#Similarly, you can change the class of any vector. To convert the class of a vector, you can use as. command.
bar <- 0:5
class(bar) #Integer
as.character(bar)
class(bar) #R converts all values into character objects
       
# List: A list is a special type of vector which contain elements of different data types. 
my_list <- list(22, "ab", TRUE, 1 + 2i)
my_list
       
#Matrices: When a vector is introduced with row and column i.e. a dimension attribute, it becomes a matrix. 
my_matrix <- matrix(1:6, nrow=3, ncol=2)
my_matrix 
dim(my_matrix) # extract dimension of matrix
attributes(my_matrix) # extract attributes of matrix
       
#Join two vectors: You can also join two vectors using cbind() and rbind() functions. But, make sure that both vectors have same number of elements. If not, it will return NA values.
x <- c(1, 2, 3, 4, 5, 6)
y <- c(20, 30, 40, 50, 60)
z <- cbind(x, y)
z
class(cbind(z)) # To check the class 
       
#Dataframe: In a matrix, every element must have the same class. But, in a data frame, you can put a list of vectors containing different classes.
df <- data.frame(name = c("ash","jane","paul","mark"), score = c(67,56,87,91))
df      
       
#Some More Data Types Examples   
title <- "R for Data Analysis"
result <- paste( "Type of title:", typeof( title ) )
print( result )
pi <- 3.14159265
dozen <- 12L
print( paste( "Type of pi:", typeof( pi ) ) )
print( paste( "Type of dozen:", typeof( dozen ) ) )
flag <- T
print( paste( "Is flag logical:", is.logical( flag ) ) )
       

#-----------Basic Computations in R
#R console can be used as an interactive calculator too. Type the following in your console:
2+3
6/ 3
(3*8)/(2*3)
log(12)
sqrt(121)

#-----------CREATING A TABLE IN R & CHANGING ROWS AND COLUMN NAMES
Tallinn <- c( 3.8, 5.5, 9.9, 15.7, 21.5, 26.3 )
Tartu <- c( 19.5, 19.4, 19.7, 20.8, 21.3, 22.7 )
Parnu <- c( 13.7, 15.4, 20.0, 24.6, 28.5, 32.7)
table <- rbind( Tallinn, Tartu, Parnu )
print( table )
rownames( table ) <- c( "Kadriog", "Kadaka", "Ulemiste" )
print( table )
colnames( table ) <- month.abb[ 1:6 ]
print( table )


#-----------To do some basic BarPlots in R
nums <- sample( 1:6, 30, replace=TRUE ) [#https://www.rdocumentation.org/packages/base/versions/3.4.3/topics/sample] [http://www.rexamples.com/14/Sample()]
print( nums )
library( ggplot2 )
qplot( nums, geom="bar",
       color=I("red"),
       fill=I("lightblue"),
       xlab="Name of student",
       ylab="Frequency",
       main="EBS IT for Business Course Attendance Review"
) + scale_x_continuous( breaks = 1:6, 
                        labels=c("Monika", "Camille", "Martin", "Sirli", "Trisha", "Gee" ) )

#-----------Some Useful R Packages
#Some of the most powerful and commonly used packages in predictive modeling 
#Importing Data: in any format such as .txt, .csv, .json, .sql etc. install and use 
data.table, readr, RMySQL, sqldf, jasonlite.
# Data Visualization:  install 
ggplot2.
#Data Manipulation:  These packages are 
dplyr, plyr, tidyr, lubricate, stringr. 
#Modeling / Machine Learning: For modeling, install packages algorithms wise such as 
randomForest, rpart, gbm etc
caret


       
       
#----------GETTING STARTED WITH ASSIGNMENT DATASET IN R

#Method 1: Select the file manually

stats <- read.csv(file.choose())
stats

#Method 2: Set Up Working Directory and Read Data

getwd()

#Windows [Depending on OS]
setwd("C:/Users/funan/Desktop/SRC")
#OR
setwd("C:\\Users\\funan\\Desktop\\SRC")

#Mac
setwd("/Users/funan/Documents/Documents - Andrew’s MacBook Pro/HP Migrated/SRC") #This worked for me
setwd("\Users\funan\Desktop\SRC")
getwd()
rm(stats)

#Load Data
stats <- read.csv("DemographicData.csv")
stats


#-------------------------------------- Exploring Data
stats
nrow(stats)
#Imported 195 rows
ncol(stats)

#Top 5 rows
head(stats)

head(stats, n=10) #to get more rows
#Tail - show bottem 6 rows
tail(stats)
str(stats)   #str() - structure   runif() - random variables distributed uniformly
summary(Stats)

#SKIP NEXT IF TIME NOT AVAILABLE
#ADDITIONAL TUTORIAL ON EXTRACTING INFORMATION WITH THE $ SIGN, ADDING & REMOVING COLUMNS, FILTERING
#---------------------Using the $ sign -shrtcut to accessing cols
Stats
head(Stats)
stats[3, 3]
stats[3, "Birth.rate"]
stats$Internet.users [#extracts all values in vector Internet.users]
stats$Internet.users[2]
stats[,"Internet.users"]     [#same as extracting with $ sign]
levels(Stats$Income.Group)    [# prints factors with values]

#----------------------------- Basic Operations with a DataFrame
stats[1:10,] #Subsetting
stats[3:9,]
stats[c(4:100),]

#Multiply Columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users
#Add column
head(Stats)
stats$MyNewCol <- stats$Birth.rate * stats$Internet.users

stats$Estonia <- 1:5
head(stats, n=10)

#remove a column
head(stats)
stats$Estonia <- NULL
stats$MyNewCol <- NULL

#----------------------------- Filtering Dataframes - Selecting rows
head(stats)
filter <- stats$Internet.users <2 [#which country has Internet user of less than 2% into new vector]
stats[filter,] [#will display only TRUE values with values less than 2%]

stats[stats$Birth.rate > 40,] [#Now greater than 40]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income", ]
levels(stats$Income.Group)

#--------------------------- Filter one country only
stats[stats$Country.Name == "Estonia",]



#DATA ANALYSIS WITH QPLOT 
#----------------------------- Intro to qplot() --powerful visuals

#install.packages("ggplot2")
library(ggplot2)

?qplot [#qplot documentation]
#qplot(data=stats, x=Internet.users) (deprecated)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3),
      colour=I("blue"))

#qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")


#DATA ANALYSIS PROPER CONTINUED
#----------------------------- Visualising what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4))

#This colors everything blue
qplot(data=stats, x=Internet.users, y=Birth.rate,
      colour=I("blue"), size=I(4))
#To color by Income.Group
qplot(data=stats, x=Internet.users, y=Birth.rate,
      colour=Income.Group, size=I(4))


