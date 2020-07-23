## Make Simulation 
set.seed(1234)
rep(c(1,2,1),each =4)
x <- rnorm(n = 12 , mean = rep(1:3 , each = 4),sd =0.2 )
y <- rnorm(n = 12 , mean = rep(c(1,2,1),each = 4) ,sd = 0.2)
plot(x,y ,col = "steelblue" , pch =20 ,cex = 2)
text(x + 0.05 ,y+0.05,labels = as.character(1:12))

# tHE BASIC is that ,Find The distance between each Observation
# here's how it goes
df <- data.frame(x=x , y=y )
dist(df) #Distance between each Obs ,Note that 
# dist() used *EUCLIDEAN distance* as the metrics

distMatrix <- as.matrix(dist(df))
distMatrix
##Modified The Diagonal ,so when we try to find the minima its easy.
diag(distMatrix) <- diag(distMatrix) + 100000

ind <- which(distMatrix == min(distMatrix) , arr.ind = T)
ind

plot(x, y,col = "blue" ,pch = 20 ,cex= 2)
text(x + 0.05 , y+0.05 ,labels =as.character(1:12))
points(x[ind[1,]] , y[ind[1,]],col = "orange" , pch = 20 ,cex= 2)

# we can see From here 67 is the Closest one.
# Now We need to merge it .
par(mfrow = c(1, 2))
plot(x, y, col = "blue", pch = 19, cex = 2, main = "Data")
text(x + 0.05, y + 0.05, labels = as.character(1:12))
points(x[ind[1, ]], y[ind[1, ]], col = "orange", pch = 19, cex = 2)
# Make a cluster and cut it at the right 
library(dplyr)

hcluster <- dist(df) %>% hclust
dendro <- as.dendrogram(hcluster)
cut(dendro, h = (hcluster$height[1] + 0.00001))
cutDendro <- cut(dendro, h = (hcluster$height[1] + 0.00001))
plot(cutDendro$lower[[11]], yaxt = "n", main = "Begin building tree")

# I dont understand The cut,so im not going to continue that yet.

myplclust <- function(hclust , lab = hclust$labels , lab.col = rep(1, length(hclust$labels)),
                      hang = 0.1 ,...)
{
  print(hclust)
  y <- rep(hclust$heigth ,2)
  x <- as.numeric(hclust$merge)
  y <- y[which(x<0)]
  x <- x[which(y<0)]
  x <- abs(x)
  y <- y[order(x)]
  x <- x[order(x)]
  plot(hclust , labels = F , hang = hang)
  text(x = x, y = y[hclust$order] - (max(hclust$height) * hang), labels = lab[hclust$order],
       col = lab.col[hclust$order], srt = 90, adj = c(1, 0.5), xpd = NA, ...)
  
}
hclustering <- data.frame(x = x , y = y) %>% dist() %>% hclust()
myplclust(hclustering , lab = rep(1:3 ,each =4 ),lab.col = rep(1:3 ,each = 4))

## I'll Back Later to this code , But i already get the intuiton .
par(mfrow = c(1,2))
data.frame(x=x ,y=y ) %>%data.matrix
dataMatrix <- data.frame(x=x ,y=y ) %>%data.matrix #Turn df to matrix
plot(x, y,col = "blue" ,pch = 20 ,cex= 2)
text(x + 0.05 , y+0.05 ,labels =as.character(1:12))
heatmap(dataMatrix ,distfun =function(df) dist(df,method = 'euclidean') ,hclustfun = function(df) hclust(df,method = 'centroid') )
?heatmap()
class(dist(df,method="euclidean"))
paste(x[6] , y[6])
paste(x[7] , y[7])
# Sometime its confusing,so hierarical clustering purpose for me
## Just try to find general relationship within variable and what rows coresspond to that
#Whooo Finally i get the idea :D
