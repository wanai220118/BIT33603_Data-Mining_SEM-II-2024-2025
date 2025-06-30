#Activity 1: Data Preparation and Package Setup 
# Clear the environment 
rm(list = ls()) 
# Install and load required packages (only run install.packages if not installed) 
install.packages(c('neuralnet','keras','tensorflow'), dependencies = TRUE) 
install.packages("tidyverse") 
# Load the required library 
library(tidyverse) 
library(neuralnet) 
# Load and preprocess the Iris dataset 
iris <- iris %>% mutate_if(is.character, as.factor) 
#The `summary` function is used for statistical analysis and data distribution.
summary(iris)  # Explore the dataset 

# Set seed for reproducibility 
set.seed(245) 

# Create an index for splitting the data (80% training, 20% testing) 
data_rows <- floor(0.80 * nrow(iris)) 
train_indices <- sample(c(1:nrow(iris)), data_rows) 

# Create training and testing datasets 
train_data <- iris[train_indices, ] 
test_data <- iris[-train_indices, ]

#----------------------------------------------------------------------------
#Activity 2: Building the Neural Network Model 
# Define the formula for the neural network model 
# Build an artificial neural network model 
model <- neuralnet( 
  Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
  data = train_data, 
  hidden = c(4, 2), 
  linear.output = FALSE 
) 

#----------------------------------------------------------------------------
#Activity 3: Evaluating the Model 
# Make predictions on the test data 
pred <- predict(model, test_data) 

# Assign predicted class labels 
labels <- c("setosa", "versicolor", "virginca") 
prediction_label <- data.frame(max.col(pred)) %>%      
  mutate(pred = labels[max.col.pred.]) %>% 
  select(2) %>% 
  unlist() 

# Create a confusion matrix 
conf_matrix <- table(test_data$Species, prediction_label) 

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

#----------------------------------------------------------------------------
#Activity 4: Visualizing the Neural Network Architecture 
# Visualize the neural network architecture 
plot(model, rep = "best") 