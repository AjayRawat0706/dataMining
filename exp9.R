# Generate random IQ values with mean = 110 and sd = 10
IQ <- rnorm(50, 110, 10)

# Sorting IQ level in ascending order
IQ <- sort(IQ)
IQ

# Generate vector with pass and fail values of 50 students
result <- c(1, 1, 0, 1, 0, 1, 0, 0, 1, 1,
            1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
            0, 0, 1, 1, 0, 1, 1, 0, 1, 0,
            1, 1, 0, 0, 1, 1, 1, 0, 0, 1,
            0, 1, 0, 0, 1, 0, 1, 1, 0, 1)

# Generate random values for additional features
age <- sample(18:22, 50, replace = TRUE)
gender <- sample(c("Male", "Female"), 50, replace = TRUE)

# Data Frame
df <- data.frame(IQ, result, age, gender)

# Print data frame
print(df)

# Plotting IQ on x-axis and result on y-axis
plot(IQ, result, xlab = "IQ Level", ylab = "Probability of Passing")

# Linear regression
lrm <- lm(result ~ IQ + age, data = df)

summary(lrm)

# Find the result of a person with IQ 120 and age 20
a <- data.frame(IQ = 120, age = 20)
predRes <- predict(lrm, a)
print(predRes)

# Create a logistic model
lgm <- glm(result ~ IQ + age + gender, family = binomial, data = df)

# Summary of the regression model
summary(lgm)

# Create a curve based on prediction using the regression model
curve(predict(lgm, data.frame(IQ = x, age = mean(df$age), gender = "Male"), type = "response")
                    , add = TRUE)


