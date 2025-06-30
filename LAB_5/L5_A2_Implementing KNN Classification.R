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