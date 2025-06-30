#Activity 1: Data Preparation and Package Setup 
# Install and load required packages if not already installed 
if (!require(rpart)) { 
  install.packages("rpart") 
} 
if (!require(rpart.plot)) { 
  install.packages("rpart.plot") 
} 

# Load the required libraries 
library(rpart)
library(rpart.plot) 

# Load the iris dataset (a built-in dataset in R) 
data(iris)

# Set a seed for reproducibility 
set.seed(123)

# Create an index for splitting the data (80% training, 20% testing) 
split_index <- sample(1:nrow(iris), 0.8 * nrow(iris))

# Create training and testing datasets 
train_data <- iris[split_index, ]
test_data <- iris[-split_index, ]

#Activity 2: Building the Decision Tree Model 
# Create a decision tree model using the training data 
tree_model <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
                    data = train_data, method = "class")

# Make predictions on the testing data 
predictions <- predict(tree_model, newdata = test_data, type = "class")

#Activity 3: Evaluating the Model 
# Create a confusion matrix 
conf_matrix <- table(test_data$Species, predictions)

# Print the confusion matrix 
print(conf_matrix)

# Calculate the error rate 
error_rate <- 1 - sum(diag(conf_matrix)) / sum(conf_matrix)
cat("Error Rate:", error_rate, "\n")

# Calculate evaluation metrics 
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
precision <- diag(conf_matrix) / rowSums(conf_matrix)
recall <- diag(conf_matrix) / colSums(conf_matrix)
f_score <- 2 * (precision * recall) / (precision + recall)

# Print evaluation metrics 
cat("Accuracy:", accuracy, "\n")
cat("Precision (per class):", paste(precision, collapse = ", "), "\n")
cat("Recall (per class):", paste(recall, collapse = ", "), "\n")
cat("F-score (per class):", paste(f_score, collapse = ", "), "\n")

# -----OR can, round values for better readability 
accuracy <-round(accuracy,2)
precision <- round(precision, 2)
recall <- round(recall, 2)
f_score <- round(f_score, 2)

# and can print each metric with class names, for easier to analyse 
cat("Precision (per class):\n")
print(setNames(precision, rownames(conf_matrix)))
cat("Recall (per class):\n")
print(setNames(recall, rownames(conf_matrix)))
cat("F-score (per class):\n")
print(setNames(f_score, rownames(conf_matrix)))

#Activity 4: Visualizing the Decision Tree 
# Plot the decision tree 
rpart.plot(tree_model, type = 2, extra = 101, fallen.leaves = TRUE)

#tree_model this is the decision tree model object created using rpart().  
#type = 2, Shows the feature (e.g., Petal.Length) and the split condition at the node. 
#extra -additional information is shown in each node (Predicted class label, 
# Probability of the winning class,Percentage of observations in that node)) 
#fallen.leaves -This makes the leaf nodes appear at the same level.It's purely for cleaner and more intuitive visualization of the tree. 
















