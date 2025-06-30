#Topic 1: Classification with Support Vector Machine(SVM) in R.
#Activity 1: Data Preparation and Package Setup 
#clear the environment 
rm(list = ls()) 
#SVM 
# Install and load necessary packages 
install.packages("e1071") 
library(e1071) 
# Load the iris dataset 
data(iris) 
# Split the dataset into training and testing sets 
set.seed(123) 
sample_indices <- sample(1:nrow(iris), 0.7 * nrow(iris)) 
train_data <- iris[sample_indices, ] 
test_data <- iris[-sample_indices, ]

#Activity 2: Building the SVM Model 
# Train the SVM model 
svm_model <- svm(Species ~ ., data = train_data, kernel = "radial")

#Activity 3: Evaluating the Model 
# Make predictions on the test set 
predictions <- predict(svm_model, test_data) 

# Evaluate the model 
conf_matrix <- table(predictions, test_data$Species) 

# Print the confusion matrix 
print(conf_matrix) 

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

#Topic 2: Classification with Random Forest in R. 
#Activity 4: Data Preparation and Package Setup
#clear the environment 
rm(list = ls()) 
# Install and load necessary packages 
install.packages("randomForest") 
library(randomForest) 
# Load the iris dataset 
data(iris) 
# Split the dataset into training and testing sets 
set.seed(123) 
sample_indices <- sample(1:nrow(iris), 0.7 * nrow(iris)) 
train_data <- iris[sample_indices, ] 
test_data <- iris[-sample_indices, ] 

#Activity 5: Building the Random Forest Model 
# Train the Random Forest model 
rf_model <- randomForest(Species ~ ., data = train_data, ntree = 500) 

#Activity 6: Evaluating the Model 
# Make predictions on the test set 
predictions <- predict(rf_model, test_data) 
# Evaluate the model 
conf_matrix <- table(predictions, test_data$Species) 
# Print the confusion matrix 
print(conf_matrix) 
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

#Topic 3: Classification with Naive Bayes in R. 
#Activity 7: Data Preparation and Package Setup
# Clear the environment 
rm(list = ls()) 
# Install and load necessary packages 
install.packages("e1071") 
library(e1071) 
# Load the iris dataset 
data(iris) 
# Split the dataset into training and testing sets 
set.seed(123) 
sample_indices <- sample(1:nrow(iris), 0.7 * nrow(iris)) 
train_data <- iris[sample_indices, ] 
test_data <- iris[-sample_indices, ] 

#Activity 8: Building the Naive Bayes Model 
# Train the Naive Bayes model 
nb_model <- naiveBayes(Species ~ Sepal.Length + Sepal.Width + Petal.Length + 
                         Petal.Width, data = train_data) 

#Activity 9: Evaluating the Model 
# Make predictions on the test set 
predictions <- predict(nb_model, newdata = test_data) 
# Evaluate the model 
conf_matrix <- table(predictions, test_data$Species) 
# Print the confusion matrix 
print(conf_matrix) 
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
