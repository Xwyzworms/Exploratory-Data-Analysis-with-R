setwd("D:\\Books\\Exploratory-Data-Analysis-with-R\\6.Graphics Devices")

#9.2# 
data(cars)
names(cars)
##Open PDF Device ;create "myplot.pdf" in current working directory
pdf(file = "myplot.pdf")

##Create plot and send it to file
with(cars, {
  plot(speed,dist,col = 'red' , pch = 20 , main = "Speed vs Dist")
  abline(lm(dist~ speed ,data = cars),lwd = 1 )
  })

dev.off()
##########Multiple Plots#

pdf(file = "Secondplot.pdf")

dev.set(2)

with(cars, {
  plot(speed,dist,col = 'red' , pch = 20 , main = "Speed vs Dist")
  abline(lm(dist~ speed ,data = cars),lwd = 1 )
})

with(cars, {
  plot(speed,dist,col = 'red' , pch = 20 , main = "Speed vs Dist")
})
dev.off()


######Copying Plots####
with(cars, {
  plot(speed,dist,col = 'red' , pch = 20 , main = "Speed vs Dist")
})

## Copy Plot to Png File
dev.copy(png , file="Example.png")
dev.off()