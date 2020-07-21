# 10. The Base Plotting System

[Now She's Gone](https://github.com/Xwyzworms/Exploratory-Data-Analysis-with-R/blob/master/7.The%20Base%20Plotting%20System/SimpleBase.R)

- The core plotting and graphics engine in R is encapsulated in the following packages:
  - graphics: contains plotting functions for the **base** graphing systems, including plot, hist, boxplot and many others.
  - grDevices: contains all the code implementing the various graphics devices, including X11, PDF, PostScript, PNG, etc.

## 10.1 Base Graphics
  - There are two phases to creating a base plot:
    - initialize Plot
    - Annotate the plot
  - par() controlling the global of behavior of plots ,such as the margins, axis orientation, and other details

## 10.2 Simple Base Graphics
- Histogram , boxplot,Scatter PLot and friends but builded by Base system.

## 10.3 Some Important Base Graphics Parameters
Here are a few key ones , for Plotting:
• pch: the plotting symbol (default is open circle)
• lty: the line type (default is solid line), can be dashed, dotted, etc.
• lwd: the line width, specified as an integer multiple
• col: the plotting color, specified as a number, string, or hex code; the colors()
function gives you a vector of colors by name
• xlab: character string for the x-axis label
• ylab: character string for the y-axis label

the par() specify *Global* Graphics Parameters that affect all plots in an **R SESSION** : These parameters can be overridden when they are specified as arguments to specific plotting functions.

• las: the orientation of the axis labels on the plot
• bg: the background color
• mar: the margin size
• oma: the outer margin size (default is 0 for all sides)
• mfrow: number of plots per row, column (plots are filled row-wise)
• mfcol: number of plots per row, column (plots are filled column-wise)

## 10.4 Base Plotting Functions
- The most basic base plotting function is plot().
- After that, annotation functions can be called to add to the already-made  plot.
- Some key annotation functions are
• lines: add lines to a plot, given a vector of x values and a corresponding vector of y
values (or a 2-column matrix); this function just connects the dots
• points: add points to a plot
• text: add text labels to a plot using specified x, y coordinates
• title: add annotations to x, y axis labels, title, subtitle, outer margin
• mtext: add arbitrary text to the margins (inner or outer) of the plot
• axis: adding axis ticks/labels

- [Link to Code](https://github.com/Xwyzworms/Exploratory-Data-Analysis-with-R/blob/master/7.The%20Base%20Plotting%20System/SimpleBase.R)
## I'D Encourage to lokkk at the code !

## 10.5 Base Plot With Regression Line
 - use lm() for linear Regression
 - use abline() To Plot it out
## 10.6 Multiple Base Plots
 - Use par() mfrow arguments(row,col)
 - That's it , every plot() func you call its going to take the coresspondng template
## 10.7

• Plotting occurs in two stages:
- Creation of a plot
- Annotation of a plot (adding lines, points, text, legends)
• The base plotting system is very flexib le and offers a high degree of control over plotting
