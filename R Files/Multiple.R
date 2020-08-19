#Multiple Linear Regression
install.packages('readr')

dataset = read_csv('50_Startups.csv')
#dataset = dataset[,2:3]
library(caTools)

 dataset$State=factor(dataset$State,
                      level= c('New York','California','Florida'),
                      labels = c(1,2,3))
set.seed(123)
split = sample.split(dataset$Profit,SplitRatio = 0.8)
training_set = subset(dataset,split==TRUE)
test_set = subset(dataset,split == FALSE)
remove(dataset$State)





regressor = lm(formula=Profit~.,
               data = training_set)
y_pred = predict(regressor,newdata = test_set)
y_pred

regressor = lm(formula=Profit~. + State,data = dataset)
summary(regressor)

split = sa
