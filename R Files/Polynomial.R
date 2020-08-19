#Polynomial Regression

dataset = read_csv('Position_Salaries.csv')

dataset = dataset[,2:4]
dataset

#set.seed(123)
# split = sample.split(dataset,Spliratio = 0.2)

#training_set = subset(dataset,split == TRUE)
#test_set = subset(dataset,split == FALSE)

#Linear
Lin_reg=lm(formula = Salary~Level,data = dataset)

dataset$Level_2 =dataset$Level^2
dataset$Level_3 =dataset$Level^3

ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             colour='red')+
  geom_line(aes(x=dataset$Level,y=predict(Lin_reg,newdata = dataset)),
            colour='blue')
              
Lin_reg3=lm(formula = Salary~.,data = dataset)

ggplot()+
  geom_point(aes(x=dataset$Level_3,y=dataset$Salary),colour='red')+
  geom_line(aes(x=dataset$Level_3,y=predict(Lin_reg3)),colour ='black')

#For Linear Regression Pred

y_pred = predict(Lin_reg,data.frame(Level=6.5))
y_pred
