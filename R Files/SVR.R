#SVR Regressor

dataset = read_csv('Position_Salaries.csv')
dataset = dataset[,2:3]
install.packages('e1071')
library(e1071)

regressor = svm(formula = Salary~.,data = dataset,
                type = 'eps-regression')
y_pred = predict(regressor,data.frame(Level = 6.5))

ggplot()+
  geom_point(aes(x =dataset$Level,y = dataset$Salary),
                 colour = 'red')+
  geom_line(aes(x = dataset$Level,y = predict(regressor,newdata=dataset)),
                                  colour='blue')
