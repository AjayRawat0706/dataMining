#Performing Naive Bayes on Dataset
# Installing Packages
install.packages("e1071")
install.packages("caTools")
install.packages("caret")

# Loading package
library(e1071)
library(caTools)
library(caret)

# data Set used 
Adult_data = AdultUCI
str(Adult_data)
summary(Adult_data)

# Splitting data into train and test data
spl = sample.split(Adult_data, SplitRatio = 0.7)
dataTrain = subset(Adult_data, spl==TRUE)
dataTest = subset(Adult_data, spl==FALSE)
dataTrain
dataTest

# Feature Scaling
train_scale <- scale(dataTrain[, 1:4])
test_scale <- scale(dataTest[, 1:4])

# Fitting Naive Bayes Model to training dataset
set.seed(120) # Setting Seed
classifier_cl <- naiveBayes(race ~ ., data = dataTrain)
classifier_cl

# Predicting on test data'
y_pred <- predict(classifier_cl, newdata = dataTest)
# Confusion Matrix
cm <- table(dataTest$race, y_pred)
cm
# Model Evaluation
confusionMatrix(cm)

