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