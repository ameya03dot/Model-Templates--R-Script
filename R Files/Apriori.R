 #Apriori

library(arules)
dataset = read.csv('Market_Basket_Optimisation.csv',header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv',sep = ',',rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset,topenv(10))

rules = apriori(data=dataset,parameter = list(support = 0.003,minlen = 2,maxlen =2,confidence = 0.2))

inspect(sort(rules,by = 'support')[1:10])