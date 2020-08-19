#Decision Tree

dataset = read_csv('Position_Salaries.csv')

dataset = dataset[,2:3]

install.packages('rpart')
library(rpart)

regressor = rpart(formula =Salary~.,data = dataset,control = rpart.control(minsplit = 1))

y_pred = predict(regressor,data.frame(Level = 6.5))
y_pred

ggplot2()+
  geom_point()