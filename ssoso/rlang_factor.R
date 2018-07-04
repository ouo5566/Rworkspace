# Create the vectors for data frame.
height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")

# Create the data frame. == table
input_data <- data.frame(height,weight,gender)
print(input_data)

# Test if the gender column is a factor.
print(is.factor(input_data$height))
print(is.data.frame(input_data))

# Print the gender column so see the levels.
print(input_data$gender)

#factor 사용하여 barplot
plot(factor(gender))
plot(factor(input_data$gender))
