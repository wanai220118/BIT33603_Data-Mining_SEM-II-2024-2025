#1. Install and load required packages
install.packages("nnet")      # For neural networks
install.packages("caret")     # For data splitting and confusion matrix
install.packages("e1071")     # Required for confusionMatrix

library(nnet)
library(caret)
library(e1071)

#2. Split the data into 70% training and 30% testing
set.seed(123)  # Makes the result the same each time you run

data(iris)
split <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
trainData <- iris[split, ]
testData <- iris[-split, ]

#3. Build a Neural Network model
# Normalize data (neural networks work best with scaled inputs)
trainData_scaled <- trainData
testData_scaled <- testData
trainData_scaled[,1:4] <- scale(trainData[,1:4])
testData_scaled[,1:4] <- scale(testData[,1:4])

# Train the model
nn_model <- nnet(Species ~ ., data = trainData_scaled, 
                 size = 5, decay = 5e-4, maxit = 200)

#4. Predict using the testing set
predictions <- predict(nn_model, testData_scaled[,1:4], type = "class")

#5. Evaluate the model
# Make sure both are factors
predictions <- as.factor(predictions)
testData_scaled$Species <- as.factor(testData_scaled$Species)

# Align the factor levels
levels(predictions) <- levels(testData_scaled$Species)

# Create confusion matrix
confMatrix <- confusionMatrix(predictions, testData_scaled$Species)
print(confMatrix)

#6. Plot the Neural Network
install.packages("NeuralNetTools")
library(NeuralNetTools)
plotnet(nn_model)
