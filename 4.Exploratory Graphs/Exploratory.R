# Set Current Directory
base::setwd("D:\\Books\\Exploratory-Data-Analysis-with-R\\4.Exploratory Graphs")

# Create Dir

if(!dir.exists("DataSet")){dir.create(DataSet)}

base::list.files()
# Read Data
#Getting Data#
classes = c("numeric","character","factor","numeric","numeric")
pollution <- utils::read.csv(".\\DataSet\\avgpm25.csv" , colClasses=classes)

head(pollution , n =4)

base::paste(utils::str(pollution))

# Getting Data .........#

#7.5 Five Number Summary #
base::paste(stats::fivenum(pollution$pm25 , na.rm = T))

# Better Using Summary ,it's more easier to read.
base::summary(pollution$pm25)

#Expected Output #
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 3.383   8.549  10.047   9.836  11.356  18.441 
## Because the Median > Mean then  its a left skewed
#From here median & mean is below the standard which 12 . But there are some counties Exceed the threshold #

#7.6 Boxplot#
graphics::boxplot(pollution$pm25 ,col ="red")

## From Graphics We know that the median is still roughly 10 , and
## We can see Outliers from here ,also the minimum and maximum percentile
## We'll Investigate these guy,outliers , the 15.
pollution %>% 
  dplyr::filter(pm25 > 15) %>% as.data.frame() %>% nrow()
# Only 8 obs if pm25 > 15 all on the west ,how about 12 ? how many ?

pollution %>% 
  dplyr::group_by(region) %>%
  dplyr::filter(pm25 > 12) %>% as.data.frame() %>%
  dplyr::summarise(neast = sum(region =="east") ,nwest = sum(region == "west"))

# Quite High Tho , 81 observation 

# So we know have that the Outliers are dominated by west .Let's take a look
library("maps")
maps::map("county" , "california")
with(dplyr::filter(pollution , pm25 > 15) , points(longitude,latitude))

#7.7 histogram#  

library('dplyr')
graphics::hist(pollution$pm25 , col = "green" , breaks = 100)
rug(pollution$pm25)
#

#7.8# Overlaying Features
## Give our plot annotations,so that is easy to understand.
## boxplot
graphics::boxplot(pollution$pm25)
graphics::abline(h = 12)

## Histogram
graphics::hist(pollution$pm25 , col = "green")
graphics::abline(v=12 ,lwd = 5 , col ='red')
graphics::abline(v = median(pollution$pm25), col = "magenta", lwd = 4)
## lwd for the Line Bold
# adding threshold to hist

#7.9#Barplot
#For categorical Variable
table(pollution$region) %>% graphics::barplot(col = "wheat")
# Dominated by east 

#===========================================================================

#7.11# Multiple Boxplots
# This is the simple one to show the relationship between two variables.
graphics::boxplot( pm25 ~ region , data = pollution , col ='red')
# y ~ x#
# We can see from here east has more 
# higher pm25 than West ,but more observation > standard.

#7.12# Multiple Histograms
# Sometime its useful to see 2 histogram distribution to know how the observation varies.

graphics::par(mfrow = c(2,1)  ) #
graphics::hist(subset(pollution , region == "east")$pm25, col ="green")
graphics::hist(subset(pollution , region == "west")$pm25 , col = "green")

#we can see from here that east is approximately norm ,while west right skewed
base::summary(subset(pollution , region == "west")$pm25) # True Mean > Median,Right

base::summary(subset(pollution , region == "east")$pm25) # True mean ~ median 

graphics::hist(subset(pollution,region == "east")$pm25 , col = "red")
# change the mfrow to , c(1,1) ) row , colum
# yep its approximately norm

#7.13# ScatterPlot
# Usually Used when you want to visualize Continouos variables . 

with(pollution , plot(latitude , pm25))# Same As below

plot(pollution$latitude , pollution$pm25)

graphics::abline(h = 12 , lty = 2 , lwd = 2)

# as you can see , there's higher pm25 at middle of county approximately 40 - 42 latitude

# Adding Col arguments

#7.14# Scatter Plot using Color

plot(pollution$latitude , pollution$pm25,col = pollution$region )
levels(pollution$region) # 1 east == Black , 2 west==Red


#7.15#
graphics::par(mfrow = c(1,2) ,mar = c(5,4,2,1))

graphics::plot( subset(pollution ,region == "west")$latitude , subset(pollution , region == "west")$pm25 , main = "WEST")
graphics::abline(h = 12 ,lty = 2 , lwd = 1)

with(subset(pollution , region == "east") , plot(latitude,pm25 , main = "EAst") )
graphics::abline(h = 12 ,lty = 2 , lwd = 1)


#Using lattice

# What we got from here is that even tho east have more observation , but there are 
# many observation > standard than West ,.