#8.1 The Base System##
with(airquality , {
  plot(Temp,Ozone , col = "red" , pch = 20) #Creating plot 
  lines(loess.smooth(Temp,Ozone))
  title("Temp vs Ozone")
})
############################
data(cars)
with(cars , {
  plot(speed , dist ,col = "orange" , pch = 20)
  abline(lm(dist~speed), lwd =1)
  title("Speed vs Stopping Distance")
  legend("topleft" , legend = "Data" , pch = 20 , col="orange")
})

## As you can see we build up plot really from blank canvas by adding more and 
## MOre addition to the plot
#############################

#8.2 The Lattice Systeme###
# Come up with lattice package
names(airquality)
library(lattice)

lattice::xyplot(Ozone ~ Wind | Day ,data = airquality ,layout =c(30,1))
                
#8.3 GGPLOT2 System##

#base + lattice = GGPLOT2 
# So you can do plotting, annotating ,conditioning as you want.

library(ggplot2)
qplot(Ozone ,Wind,data = airquality)
