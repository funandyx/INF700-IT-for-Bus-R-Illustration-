#Download data from canvas (DemographicData.csv)

#Load library with packages
lapply(.packages(all.available = TRUE), function(xx) library(xx,     character.only = TRUE))

#My First Variable in R
name <- "Username"
name <- "Andrew"
print( name )


#Understanding DataTypes in R
title <- "R for Data Analysis"
result <- paste( "Type of title:", typeof( title ) )
print( result )
pi <- 3.14159265
dozen <- 12L
print( paste( "Type of pi:", typeof( pi ) ) )
print( paste( "Type of dozen:", typeof( dozen ) ) )
flag <- T
print( paste( "Is flag logical:", is.logical( flag ) ) )


#CREATING A TABLE IN R & CHANGING ROWS AND COLUMN NAMES
Tallinn <- c( 3.8, 5.5, 9.9, 15.7, 21.5, 26.3 )
Tartu <- c( 19.5, 19.4, 19.7, 20.8, 21.3, 22.7 )
Parnu <- c( 13.7, 15.4, 20.0, 24.6, 28.5, 32.7)
table <- rbind( Tallinn, Tartu, Parnu )
print( table )
rownames( table ) <- c( "Kadriog", "Kadaka", "Ulemiste" )
print( table )
colnames( table ) <- month.abb[ 1:6 ]
print( table )


#To do some basic BarPlots in R
nums <- sample( 1:6, 30, replace=TRUE )
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


#GETTING STARTED WITH ASSIGNMENT DATASET IN R

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


