#Knn
dataset = read.csv('Social_Network_Ads.csv')

dataset = dataset[3:5]
dataset$Purchased = factor(dataset$Purchased,levels = c(0,1))

library(caTools)
set.seed(123)

split = sample.split(data$Purchased,SplitRatio = 0.75)
training_set = subset(dataset,split ==TRUE)
test_set = subset(dataset,split ==FALSE)

training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

install.packages('class')
library(class)
y_pred = knn(train = training_set[,-3],test = test_set[,-3],cl = training_set[,3], k = 5)
y_pred

cm = table(test_set[,3],y_pred)
cm
