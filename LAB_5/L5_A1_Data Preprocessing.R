# Clear existing variables 
rm(list = ls())

# Install and load necessary package 
install.packages("caTools")
library(caTools)

# Load the dataset 
Dataset <- read.csv("dataset.csv")
View(Dataset)

# Handle missing values by replacing them with the mean 
Dataset$Age <- ifelse(is.na(Dataset$Age),
                      ave(Dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                      Dataset$Age)

Dataset$Salary <- ifelse(is.na(Dataset$Salary),
                         ave(Dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                         Dataset$Salary)

# Encode categorical variables 
Dataset$Country <- factor(Dataset$Country,
                          levels = c("France", "Spain", "Germany"),
                          labels = c(1, 2, 3))

Dataset$Purchased <- factor(Dataset$Purchased,
                            levels = c("No", "Yes"),
                            labels = c(0, 1))

# Split the dataset into training and testing sets 
set.seed(123)
split <- sample.split(Dataset$Purchased, SplitRatio = 0.8)
training_set <- subset(Dataset, split == TRUE)
test_set <- subset(Dataset, split == FALSE)

# Feature scaling 
training_set[, 2:3] <- scale(training_set[, 2:3])
test_set[, 2:3] <- scale(test_set[, 2:3])