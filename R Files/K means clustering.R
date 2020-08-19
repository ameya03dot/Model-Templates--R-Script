#K means clustering

dataset = read.csv('Mall_Customers.csv')

X <- dataset[4:5]

#Using the elbow method

set.seed(6)
wcss <- vector()
for (i in 1:10) wcss[i]<- sum (kmeans(X,i)$withins)
plot(1:10,wcss,type = 'b', main = paste('Clusters'))

set.seed(29)
kmeans <- kmeans(X,5,iter.max = 300,nstart =10)

library(cluster)
clusplot(X,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusets'))