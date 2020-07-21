setwd("D:\\Books\\Exploratory-Data-Analysis-with-R\\7.The Base Plotting System")

data("airquality")
#Histogram#
hist(airquality$Ozone , main ="Airqual Vs Ozone" )

#Boxplot#
airquality$Month

airquality = transform(airquality ,Month = factor(Month))
boxplot(Ozone ~ Month , airquality ,xlab = "Month" , ylab="Ozone")
factor(airquality$Month)

#Scatter Plot#

with(airquality , {
  plot(Wind,Ozone , col = "red" , pch =20,
       xlab = "ANGIN COK" , ylab = "OZONE MATAMU")
  title("Sampis")
})
#10.3 Some Important Base Par() check#
par('lty') # Default
par("col")#Default
par("pch") # Default

#For Global
par("mar")
par("bg")


#10.4 Base Plotting Func#

with(airquality , 
     {
       plot(Wind,Ozone , col ="red" , pch =20)
       title("Sampis")
     })
## Doing Subset and plotting it down
with(airquality,{
  plot(Wind,Ozone , main = "Sampis" , pch=21)
})
with(subset(airquality,Month == 5) , points(Wind,Ozone,col = 'blue' , pch =20))
with(subset(airquality, Month != 5), points(Wind,Ozone,col = "red" , pch = 20))
# Or you can do dis

with(airquality,{
  plot(Wind,Ozone , pch = 20 , main = "Sampis" )
  with(subset(airquality, Month == 5),points(Wind,Ozone,col = "blue" , pch = 20))
  with(subset(airquality, Month != 5) ,points(Wind,Ozone,col = 'red' , pch = 20))
  legend("topright",pch = 20 ,col = c("blue","red") ,legend = c("May","Others"))
  })

#10.5 Base Plot With Regression Line#

with(airquality,{
  plot(Wind,Ozone , pch = 20 , main = "Sampis" )
  with(subset(airquality, Month == 5),points(Wind,Ozone,col = "blue" , pch = 20))
  with(subset(airquality, Month != 5) ,points(Wind,Ozone,col = 'red' , pch = 20))
  abline(lm(Ozone~Wind),lwd = 2)
  legend("topright",pch = 20 ,col = c("blue","red") ,legend = c("May","Others"))
})

## As we can See Negative Correlation ,

#10.6# Multiple Base Plots

par(mfrow = c(1,3) , mar = c(4,4,1,1) , oma =c(1,0,2,0))

with(airquality , {
  plot(Wind,Ozone , main = "Ozone and wind")
  plot(Solar.R,Ozone, main = "Ozone and Solar")
  plot(Temp , Ozone , main = "Ozone And tempreature")
  mtext("Ozone and weather in NYC" , outer = T)
})
