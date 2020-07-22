#16.2#

library(ggplot2)
data("airquality")

# Let's Take A look data 

str(airquality)

## Expected output :


# data.frame':	153 obs. of  6 variables:
# $ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
# $ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
# $ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
# $ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
# $ Month  : int  5 5 5 5 5 5 5 5 5 5 ...
# $ Day    : int  1 2 3 4 5 6 7 8 9 1
# 0 ...
# 

# #16.3# 
head(airquality , n =4)

g <- ggplot(airquality , aes(Ozone, Solar.R))

summary(g)
# Expected Output : 

# data: Ozone, Solar.R, Wind, Temp, Month, Day [153x6]
# mapping:  x = ~Ozone, y = ~Solar.R
# faceting: <ggproto object: Class FacetNull, Facet, gg>
# compute_layout: function
# draw_back: function
# draw_front: function
# draw_labels: function
# draw_panels: function
# finish_data: function
# init_scales: function
# map_data: function
# params: list
# setup_data: function
# setup_params: function
# shrink: TRUE
# train_scales: function
# vars: function
# super:  <ggproto object: Class FacetNull, Facet, gg>

class(g)

print(g)

#Expected Output : 
## Show Nothing 

#16.4 First Plot with Point Layer

# Remember Geom ? yep that's for plotting
g <- ggplot(airquality , aes(Ozone , Solar.R)) + geom_point()
print(g)

## You'll See Aplot


#16.5 Adding More Layers: Smooth

# We'll Look at trends using the Smooth geom
g + geom_point() + geom_smooth(se = F)
# You Shold see a morelikely Positive Trend
g + geom_point() + geom_smooth(se = F , method = "lm")

#This Plot will show Linear Regression ,and in fact it's Positive Correlation .
# So What we get is that Higher ozone tend to make SOlar.R Getting Higher also.

# 16.6 Adding More Layers: Facets
# This One is adding 1 categorical variables,well see that ,how our obs
# trends look alike ,in this case for each Month

g + geom_point()+
  geom_smooth(se = F , method = "lm") + 
  facet_grid(. ~ as.factor(Month)) +
  theme_dark()

## We can see from here nearly all months having a positive corellation .

#16.7 Modifying Geom Properties, SO Geom_points Basically is a constant,so you can 
# Modified it AND the BASE Args you can it here to . 
g + geom_point(aes(col = as.factor(Month)) , alpha = 0.5
               , size = 5 , pch = 20) +
  labs(title = "Dont Let Me be gone" , x = "Gone") 

#16.8 Modifying Labels

g + geom_point(aes(col = as.factor(Month)) , alpha = 0.5
               , size = 5 , pch = 20) +
  labs(title = "Dont Let Me be gone" , x = "OZONE" , y = expression("Omaygat" * lol[23])) 
  
 # labs --> labels 
##16.9 Customizing the Smooth
g + geom_point(aes(col = as.factor(Month) ), alpha = 0.6 , size = 5,pch = 20) +
  geom_smooth(se = F , method = "lm" , linetype = 2 ,size =2) + 
  facet_grid(. ~ as.factor(Month))

# this plot just more enjoyable to read.
##16.10 Changing Theme
g + geom_point(aes(col = as.factor(Month) ), alpha = 0.6 , size = 5,pch = 20) +
  geom_smooth(se = F , method = "lm" , linetype = 2 ,size =2) + 
  facet_grid(. ~ as.factor(Month))+
  theme_bw(base_family = "Times")

?theme_bw()


##16.11 More Complex , We will Transform something
names(airquality)
# Will Make Change the Day into an interval 

#seq(0,1,length = 4)
## Store the quantile of Day by probs 0000,0.333,0.66666,1,000000
Dayz <- quantile(airquality$Day , probs = seq(0 , 1 ,length = 4) , na.rm = T)

##Cut The Day Variable
airquality$DayZCutted <- cut(airquality$Day,Dayz )

levels(airquality$DayZCutted)
g <- ggplot(airquality , aes(Ozone , Solar.R))
g + geom_point(alpha = 0.5 ,col = "green" ,na.rm = T) +
  facet_wrap(as.factor(Month)~DayZCutted )+
  geom_smooth(method = "lm" , se = F ,col = "steelblue") +
  theme_dark()
  

# 16.12 A Quick Aside about Axis Limits
# Sometime An OUTLIER IS skipped by this ggplot ,so we need to make sure its not skipped
# Otherwise we losing an information

# We will Build the Simulation Data

test <- data.frame(x = 1:100 , y = rnorm(100))
test[50,2] <- 1000 #Making Outliers.
plot(test$x,test$y,type = "l",ylim = c(-3,3) )

# Above is example using base graphics

g <- ggplot(test , aes(x,y))
g +geom_line() + coord_cartesian(ylim = c(-3,3)) # Note,The outlier is missing

# Above is example using ggplot :D
