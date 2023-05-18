# Perform Statistical analysis of data

library("RWeka")

data= read.arff("firstarff.arff")

# Print Data
print(data)

# Cat is used so that the newline characters are treated as string and not vectors
cat("\n\n\n")

# Printing first two rows from the data set
print(head(data,2))

# To find the dimensions of data set
dim(data)

# To find the names of variables (Column names) in data set
names(data)

# Show all the branch
data["branch"]

# Show no_of_student
data["no_of_student"]

# Show max of  no_of_student
max(data["no_of_student"])

# Show min of  no_of_student
min(data["no_of_student"])

# Sum of no_of_student
sum(data["no_of_student"])

# Mean of no_of_student
#mean(data["no_of_student"])

# Create a vector. 
M <- c(12,7,23,4.2,38,2,5,-21,8,-5)

# Find Mean.
r<- mean(M)
print(r)

# Median of  no_of_student
#median(sort(data["no_of_student"]))

median(sort(M))


# To generate a summary of data
summary(data)

print(class(branch))
print(is.factor(branch))
branchfact<-factor(branch)
print(is.factor(branchfact))
print(levels(branchfact))
print(class(branchfact))
