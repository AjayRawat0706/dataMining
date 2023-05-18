# Create a dataset with 500 random values
data <- rnorm(500)
print(data)

# Add 10 random outliers to the data
data[1:10] <- c(100, -50, 80, -70, 120, -90, 110, -80, 130, -60)

# Create additional features
category <- sample(c("A", "B", "C", "D"), 500, replace = TRUE)
age <- sample(18:65, 500, replace = TRUE)

# Combine data and features into a data frame
df <- data.frame(data, category, age)

# Draw a boxplot to identify outliers
boxplot(df$data)

# Remove the outliers from the data using the boxplot.stats() function
df <- df[!df$data %in% boxplot.stats(df$data)$out, ]

# Draw a boxplot again to verify if outliers were removed
boxplot(df$data)

# Print the modified data frame
print(df)


