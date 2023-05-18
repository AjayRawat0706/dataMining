# Association rule Mining 
#Apriori Algorithm
install.packages("arules")
install.packages("arulesViz")
library(arules)
# librari for apriori rule vizulization
library(arulesViz)

library(RColorBrewer)

#import dataset
data("Groceries")
print(Groceries)
summary(Groceries)

#generating Rule 1st
#using apriori() function 

rule1 <- apriori(Groceries , parameter = list (supp = 0.01 , conf = 0.2))


#using inspect( ) function
inspect(rule1[1:6])
inspect(head(rule1, 5 ))
inspect(head(sort(rule1,by = "lift") , 5))



#Ploting the rule
#using plot () function

plot(rule1)
plot(rule1, method = "grouped")



#rule 2nd

rule2 <- apriori(Groceries , parameter = list (supp = 0.05 , conf = 0.08))


#using inspect( ) function

inspect(head(sort(rule2,by = "lift") , 5))



#Ploting the rule
#using plot () function

plot(rule2)
plot(rule2, method = "grouped")



