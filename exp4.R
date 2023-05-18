#Library calling and printing Summary:
library("arules")
library(arulesViz)
data("DataSetA")
print(DataSetA)
summary(DataSetA)

#FP Growth Rule generation
fprules <- fim4r(DataSetA, method = "fpgrowth", 
                 target = "rules", supp = 40, conf = 30)

fprules

# inspect and Plotting the rule
inspect(fprules[1:5])

plot(fprules)


#creating dataframe for fp rules

x <- as(fprules,"data.frame")
print(x)

write.csv(x, file="DataSetArules.csv")

fprules2 <- fim4r(DataSetA, method = "fpgrowth", 
                 target = "rules", supp = 30, conf = 40)

fprules2
plot(fprules2)

fprules3 <- fim4r(DataSetA, method = "fpgrowth", 
                  target = "rules", supp = 50, conf = 40)

fprules3
plot(fprules3)