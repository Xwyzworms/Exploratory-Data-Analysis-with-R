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

#