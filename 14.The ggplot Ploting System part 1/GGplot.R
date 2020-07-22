#15.Pada Semua Bisikan ku ???Memmanggil NAMA MU #

## Example using base Graphic 
data(airquality)
with(airquality , {
  plot(Temp , Ozone ,pch = 20 , col = "blue" , main = "Ozone and Temp")
  points(loess.smooth(Temp , Ozone) , col = "red" , type = 'l')
})

## it's Convenient right ? but lets see with GGplot

## Example using ggplot2 

library(ggplot2)
ggplot(airquality , aes(Temp , Ozone)) + 
  geom_point() + 
  geom_smooth(method = "loess" ,se = F , col = "red") + 
  theme_classic() + 
  labs(x = "TEMP" , y = "OZONE" , title = "Ozone And temp")
### Look Smotther and also you can change 

#15.3 ggplot2#

data(mpg)
str(mpg)

qplot(displ , hwy , data = mpg)

#15.4 Modifying Aesthethics # 

qplot(displ , hwy , data = mpg , color = drv)

#15.5 Adding A geom#

qplot(displ , hwy ,data = mpg , geom = c("point" , "smooth"))  
  
#15.6 Histogram#
qplot(hwy, data=mpg ,fill = drv , binwidth = 1)

#Also you Can Create Boxplot
qplot(drv , hwy ,data = mpg, col = "red" ,geom = c("boxplot"), main = "Title Here" )

#15,7 Facets#
qplot(hwy , data = mpg , facets = drv ~ . , binwidth = 2)

##Creating Scatter plot of engine displacement and highway miles by drives
qplot(displ , hwy ,data = mpg , facets = . ~ drv ) +
  geom_smooth(se = F , method = "lm")


#15.8 Case Study : Another Dataset#

names(mpg)
qplot(hwy , data =mpg ,binwidth = 1)

qplot(hwy ,data = mpg , fill = drv , binwidth = 1)

## plot density Overall hwy
qplot(hwy ,data = mpg ,geom = "density")

## Plot density hwy by drv

qplot(log(hwy) , data = mpg ,fill =drv ,geom = "density") 
# OR 
par(mfrow = c(1,2))
qplot(log(hwy) , data = mpg ,color = drv , geom = 'density')
qplot(hwy , data = mpg ,color = drv , geom = 'density')

#Making Scatter plot $ change the shape & All of it#
qplot(displ , hwy ,data = mpg 
      ,col = drv,facets = .~drv 
      ,geom = c("point") ,shape = drv) 
+ geom_smooth(method = "lm")

## col,shape As Constant
qplot(displ , hwy ,data = mpg , 
    col = "blue" , shape = 's' )
?qplot

