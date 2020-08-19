#Decision Tree Classification

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[,1:3]

dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

set.seed(123)
split = sample.split(dataset$Purchased,SplitRatio = 2/3)

training_set = subset(dataset,split ==TRUE)
test_set = subset(dataset,split ==FALSE)

# training_set[-3] = scale(training_set[-3])
# test_set[-3]= scale(test_set[-3])

library(rpart)
classifier = rpart(formula = Purchased~.,data = training_set)
y_pred = predict(classifier,newdata = test_set[-3],type = 'class')


cm = table(test_set[,3],y_pred)
cm

plot(classifier)
text(classifier)
