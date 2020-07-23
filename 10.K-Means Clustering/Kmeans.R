# 13.1 Illustrating the K-means algorithm


# Create Data Simulation 
set.seed(1234)
par(mfrow=c(1,1))
x <- rnorm(12 , mean = rep(1:3 ,each = 4) ,sd = 0.2)
y <- rnorm(12 , mean = rep(c(1, 2, 1) ,each = 4) ,sd = 0.2)
plot(x,y,col="blue" , pch = 20 , cex = 1)


df <- data.frame(x,y)
kmeans <- kmeans(df , centers = 3)
names(kmeans)
plot(x,y,col = kmeans$cluster ,pch =20 , cex =2)
points(kmeans$centers[,1] , kmeans$centers[,2] , pch = 4 ,col = c("black","red","green"))
kmeans$centers

## 13.2 Stopping the algorithm ,
# Well there is a solution ,se below :D
# I'll Make simulation with 1000 
set.seed(1234)
x <- rnorm(1000 , mean = rep(1:4 ,each = 4) ,sd = 0.25 )
y <- rnorm(1000 , mean = rep(c(1,2,1,2) ,each = 4) ,sd = 0.25)
plot(x,y,col = "blue" ,pch = 20 ,cex =1)
df <- data.frame(x,y)
kmeans <- kmeans(df , iter.max= 25 , center = 4)
plot(df$x,df$y,col = kmeans$cluster ,pch =20 , cex =2)
points(kmeans$centers[,1] , kmeans$centers[,2] , pch = 4 ,col = c("black","red","green") )

## Lets See The animation 
library(animation)
library(NbClust)
library(factoextra)
library(ggplot2)
set.seed(1234)
kmeans.ani(df[1:2] , 4)
names(kmeans)
# Get The Idea ? Im sure you get it.
# So Know We try to find the Best K ,using Elbow Methods ,this is not covers in book,but worth to know .
kmeanSum <- function(k)
  {
    kmean <- kmeans(df, k )
    return (kmean$tot.withinss)
}
sat <- function(dat,k)
{
  kmeanres <- c()
  k <- c(2:k)
  for(i in k)
    {
    kmean <- kmeans(x = dat,centers =i)
    append(kmeanres , kmean$tot.withinss)
  }
  return (kmeanres)
}

rm(kmeans)
?fviz_nbclust
# Elbow Method :d
fviz_nbclust(df, FUNcluster = kmeans ,method = 'wss' ) +
  geom_vline(xintercept = 4, linetype = 2)+
  labs(subtitle = "WSS") 

wss <- sapply(2:25, kmeanSum)
wss2 <- sat(df , 25)


elbow <- data.frame(2:25 , wss2)
plot(elbow$X2.25 , elbow$wss , col = "blue")
points(elbow$X2.25 , elbow$wss , type = "b" , col = "red")
?mapply
## Ggplot
#
ggplot(elbow , aes(X2.25 , wss))+
  geom_point(col  ="blue" ,pch =20 ,size = 3 ,)+
  geom_line() +
  scale_x_continuous(breaks = seq(1,25 ,by =1))


