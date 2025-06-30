set.seed(123)

# Split 80% training, 20% testing
split <- sample.split(Dataset$Purchased, SplitRatio = 0.8)
training_set <- subset(Dataset, split == TRUE)
test_set <- subset(Dataset, split == FALSE)

# Standardize (normalize) features Age and Salary
training_set[, 2:3] <- scale(training_set[, 2:3])
test_set[, 2:3] <- scale(test_set[, 2:3])

View(training_set)
View(test_set)