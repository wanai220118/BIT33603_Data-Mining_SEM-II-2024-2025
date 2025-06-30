# Define a range of k values 
k_values <- 1:10 
accuracy <- numeric(length(k_values)) 

# Loop through different k values 
for (i in k_values) { 
  predicted <- knn(train = training_set, test = testing_set, 
                   cl = training_labels, k = i) 
  cm <- confusionMatrix(data = predicted, reference = testing_labels) 
  accuracy[i] <- cm$overall['Accuracy'] 
} 

# Plot accuracy vs. k 
plot(k_values, accuracy, type = 'b', 
     xlab = 'Number of Neighbors (k)', 
     ylab = 'Accuracy', 
     main = 'KNN Accuracy for Different k Values')