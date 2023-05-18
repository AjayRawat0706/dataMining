# Installing Packages
install.packages("ClusterR")
install.packages("cluster")

# Loading package
library(ClusterR)
library(cluster)

data("USArrests")      # Loading the data set
df <- scale(USArrests) # Scaling the data

# View the firt 3 rows of the data
head(df, n = 3)



# Fitting K-Means clustering Model
# to training dataset
set.seed(240) # Setting seed
kmeans.re <- kmeans(USArrests, centers = 3, nstart = 20)
kmeans.re

# Cluster identification for
# each observation
kmeans.re$cluster

# Confusion Matrix
cm <- table(USArrests$Assault, kmeans.re$cluster)
cm




# Model Evaluation and visualization

plot(USArrests[c("Assault", "Murder")])
plot(USArrests[c("Assault", "Murder")],
     col = kmeans.re$cluster)
plot(USArrests[c("Assault", "Murder")],
     col = kmeans.re$cluster,
     main = "K-means with 3 clusters")



## Plotiing cluster centers
kmeans.re$centers
kmeans.re$centers[, c("Assault", "Murder")]

# cex is font size, pch is symbol
points(kmeans.re$centers[, c("Assault", "Murder")],
       col = 1:3, pch = 8, cex = 3)

## Visualizing clusters
y_kmeans <- kmeans.re$cluster
clusplot(USArrests[, c("Assault", "Murder")],
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Cluster USArrests"),
         xlab = 'Assault',
         ylab = 'Murder')
