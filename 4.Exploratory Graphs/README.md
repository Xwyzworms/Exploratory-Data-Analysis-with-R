# Exploratory Graphs

## 7.0# Why do we use Graphs in Data Analysis
1. To understand data properties
2. To Find Patterns in Data
3. To suggest modelling strategies
4. To 'debug' analyses
5. To communicate Result  <<-- For **FINAL** Graphs

## 7.1# Characteristic of Exploratory Graphs
* Note --> There's A difference between **EXPLORATORY** and **FINAL** Graphs
  - EXPLORATORY for Checking out data .
  - FINAL for communicate/present the Graphs.

- What's The Characteristic then ?
 1. For Personal Understanding
 2. Made Quickly
 3. Large Number are made.
 4. Axes/legends are generally cleaned up <<-- Addition if want to present the graphs
 5. Color/size primarilly used for addition information. <<-- Addition To.

## 7.2# Data: Air Pollution in the united states
- [x] [Link To dataset](https://github.com/Xwyzworms/Exploratory-Data-Analysis-with-R/tree/master/4.Exploratory%20Graphs/DataSet/)
* Note : Question --> *Are there any counties in the U.S that Exceed the national standard for FINE particle pollution ?*
### This Question is kinda sharp ,but we can make it more sharp ,just take a look first.
#### If we take a look .Counties that have particle pollution > standard it will face serious legal consiquences .

## 7.3# Getting the data
* At Exploratory.R

## 7.4# Simple Summaries : One Dimension
 1. Five-Number_Summary --> percentile,median,and his friends.Only texts
 2. BoxPlots --> Graphs from Five-Number-Summary also you can get the Outliers plot .
 3. BarPlot: Useful for visualizing categorical data,with the number of entries of each category being propotional to the height of the bar.
 4. Histogram: Show Complete Empirical Distribution data {modality ,Skewed}
    * Modality -->  Uni modal , bimodal,uniform,multi modal
    * Skewed --> left/right skewed / Symmetry.7
 5. Density plot --> Estimated of the distribution of a variables/features/columns.  

##  Note 7.5 to 7.9 going to take up in the R code.
- [x] [Link](https://github.com/Xwyzworms/Exploratory-Data-Analysis-with-R/tree/master/4.Exploratory%20Graphs/Exploratory.R)

## 7.10# Simple Summaries: Two  Dimension and Beyond.

## Key note here :
- Sometimes it's Useful to plot multiple hist/bar/box when it's naturally categorical variables / numerical is also useful.

- Scatterplot is for visualizing two continuous variables. Transformation Might help to get effective visualization.

- We can use tools to visualize data more than 2 dimension :
  * Conditioning Plots (using lattice/ggplot2)

  * Use color,size,shape to add dimension {Bar plot for example.}

  * Interactive plots --> i still dont get it.

  * Actual 3-D plots.Well this is obvio.

## 7.11 - 7.15#  
 - [x] [Link](https://github.com/Xwyzworms/Exploratory-Data-Analysis-with-R/tree/master/4.Exploratory%20Graphs/Exploratory.R)

## 7.16 Summary
Exploratory plots are **"quick and dirty"** and their purpose is to let you **summarize the data** and **highlight any broad features**. They are also useful for exploring **basic questions** about the data and for judging the evidence for or against certain hypotheses.


## End of the chapter : ##
