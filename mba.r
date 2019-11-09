install.packages("arules")
install.packages("Matrix")
library(arules) 
setwd("C:\\Users\\LOHANI\\Downloads")

Telco = read.transactions("Telco.csv", format="single",cols=c(1,2)) 


itemFrequencyPlot(Telco,topN=20,type="absolute") 


rules = apriori(Telco, parameter = list(supp = 0.01, conf = 0.8)) 
summary(rules) 


options(digits=2)
rules = sort(rules, by="confidence", decreasing=TRUE) 
inspect(rules[1:9]) 


rules = sort(rules, by="lift", decreasing=TRUE) 
inspect(rules[1:9]) 


rules = apriori(data=Telco, parameter=list(supp=0.01,conf = 0.8), appearance = list(default="lhs",rhs="Smart"))
inspect(rules[1:2])

rules=sort(rules, decreasing=TRUE,by="confidence") 
inspect(rules[1:2])


#From the rules obtained one interesting relation is that of the "Smart Mobile Package". 
#The lift is pretty high and we could think of trying to sell the "Smart Mobile" package to customers who buy the "10" and "30". 