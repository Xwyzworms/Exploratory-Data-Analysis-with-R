## Setting Working Directory
setwd(dir = "D:\\Books\\Exploratory-Data-Analysis-with-R\\2.Exploratory Data Analysis Checklist")
list.files()

# Creating Directory For datasets
if(dir.exists("dataset")){dir.create("dataset")}

#5.2# Read in Data

##Load Library
library(readr)
library(dplyr)
ozone <-read_csv(".\\Dataset\\hourly_44201_2014\\hourly_44201_2014.csv",
                 col_types = "ccccinnccccccncnncccccc")
# c : character
# i : integer
# n : Numeric

base::names(ozone)

base::names(ozone) <- base::make.names(base::names(ozone))

#5.3# Check The Package
base::nrow(ozone) # 9060694

base::ncol(ozone) # 23

#5.4# Run Str()

utils::str(ozone)

#5.5# Look at the top and the bottom of data 
head(ozone[, c(6:7 , 10)]) # take 6,7,and 10 col

tail(ozone[, c(6:7,10)])

#5.6# Check your "n"s
table(ozone$Time.Local) ## Result seems already fixed,different from the books

dplyr::filter(ozone , Time.Local == "13:00" && County.Name == "Franklin") %>%
  dplyr::select(State.Name , County.Name , Date.Local,
                Time.Local , Sample.Measurement)# No output

dplyr::filter(ozone , State.Code =="36" &
                County.Code == "033", Date.Local =="2014-09-30") %>%
  dplyr::select(Date.Local , Time.Local ,Sample.Measurement) %>% as.data.frame

## Data Is Tidy ,there's nothing false 

## Checking How many State
dplyr::select(ozone, State.Name) %>% base::unique() %>% nrow() #53
## Seems odd because US only has 50 States 
base::unique(ozone$State.Name)
## Washington , D.C (District of Columbia ,puerto Rico ,country of mexico) Are tje extra states.
# BUt its okay .

## Validate with At least one external data source

# So from the link We get that in 2015 should not exceed 0.075 ppm
base::summary(ozone$Sample.Measurement)
#Reality Mean is (0.03027 , and median 0.0300) <-- lower than 0.075 
stats::quantile(ozone$Sample.Measurement , probs = seq(0, 1, 0.1))
?stats::quantile

## Means that data in right magnitude probably an outlier.
##Roughly < 10% of data are above 0.075 
dplyr::filter(ozone , Sample.Measurement > 0.075) %>%
  select(County.Code ,Sample.Measurement) %>% print
# Roughly 30,102 obs ,quite high actually ,
dplyr::filter(ozone , Sample.Measurement > 0.075) %>%
  select(County.Code ,Sample.Measurement) %>% as.data.frame %>%
  dplyr::arrange(Sample.Measurement) %>%
  tail(n=100)

# Wow there's alot observation > 0.100 ppm

#5.8# Try the easy solution first
# Example Question 
# Which counties in the United States have the highest levels of ambient ozone
# pollution?
ozone %>% dplyr::group_by(State.Name,County.Name) %>%
  dplyr::summarize(ozone = mean(Sample.Measurement)) %>%
  as.data.frame() %>%
  dplyr::arrange(desc(ozone)) -> rangking

## Checking The Highest County
ozone %>% dplyr::filter(State.Name == "Colorado" & 
                          County.Name == "Clear Creek") %>% nrow() # 6447 <<-- Well if 


ozone <- dplyr::mutate(ozone , Date.Local = as.Date(Date.Local))

ozone %>% dplyr::filter(State.Name == "Colorado" & County.Name == "Clear Creek") %>%
  dplyr::mutate(dmonth = factor(base::months(Date.Local) , levels = month.name)) %>% 
  dplyr::group_by(dmonth) %>% 
  dplyr::summarize(ozone = mean(Sample.Measurement))
  
# March Missing 

## Cheking the Lowest County
ozone %>% dplyr::filter(State.Name == "Puerto Rico",County.Name == "Catano") %>%
  dplyr::mutate(dmonth = base::factor(base::months(Date.Local) , levels = month.name)) %>%
  dplyr::group_by(dmonth) %>%
  dplyr::summarize(ozone = mean(Sample.Measurement))
0.007 > 0.003  
# Probably The low ozone means there are in certain Season in fact its summer season,well in 2014 maybe people in
## puerto rico dont use their car / maybe lazy ,i dont know ...


#5.9# Challenge your Solution
## Even if you get that ez thngs ,it should not stop you
# the easy answer seemed to work okay in that it gave us a listing of counties that had
#the highest average levels of ozone for 2014.

## We're going to Shuffle the data ,we will approximate is our ranking is stable from year to year 

base::set.seed(10234)
N <- base::nrow(ozone)
idx <- base::sample(x = N , size = N ,replace = T)
ozone2 <- ozone[idx ,]

ozone2 %>% dplyr::group_by(State.Name , County.Name) %>%
  dplyr::summarize(ozone = mean(Sample.Measurement)) %>%
  as.data.frame() %>% dplyr::arrange(dplyr::desc(ozone)) -> rangking2

base::cbind(head(rangking , 10),
            head(rangking2 , 10) )  

base::cbind(tail(rangking , 10),
            tail(rangking2 , 10) )


## It's nearly identical,it show that roughly next year will be stable , but that is a hypothesis.
