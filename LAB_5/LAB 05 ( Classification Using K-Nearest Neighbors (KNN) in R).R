##############DATA PREPROCESSING##############

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

##############IMPLEMENTING KNN CLASSIFICATION##############

# Install and load necessary package 
install.packages("class")
library(class)

# Define training and testing datasets 
training_set <- Dataset[1:6, ]
testing_set <- Dataset[7:10, ]

# Define labels 
training_labels <- Dataset[1:6, 4]
testing_labels <- Dataset[7:10, 4]

# Apply KNN algorithm 
testing_result <- knn(train = training_set,
                      test = testing_set,
                      cl = training_labels,
                      k = 1)

# View results 
print(testing_result)

##############EVALUATING MODEL PERFORMANCE##############

# Install and load necessary packages 
install.packages('gmodels')
library(gmodels) 

# Create a cross table 
CrossTable(x = testing_labels, 
           y = testing_result, 
           prop.chisq = FALSE) 

# Install and load caret package for confusion matrix 
install.packages('caret') 
library(caret) 

# Generate confusion matrix 
output <- confusionMatrix(data = testing_result, 
                          reference = testing_labels) 
print(output)

##############EXPLORING DIFFERENT K VALUES##############

# Define a range of k values 
k_values <- 1:10 
accuracy <- numeric(length(k_values)) 

# Loop through different k values 
for (i in k_values) { 
  predicted <- knn(train = training_set, test = testing_set, cl = training_labels, k = i) 
  cm <- confusionMatrix(data = predicted, reference = testing_labels) 
  accuracy[i] <- cm$overall['Accuracy'] 
} 

# Plot accuracy vs. k 
plot(k_values, accuracy, type = 'b', 
     xlab = 'Number of Neighbors (k)', 
     ylab = 'Accuracy', 
     main = 'KNN Accuracy for Different k Values')
