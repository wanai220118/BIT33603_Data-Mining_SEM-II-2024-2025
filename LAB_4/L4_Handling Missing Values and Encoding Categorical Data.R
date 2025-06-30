# Load dataset
Dataset <- read.csv("dataset.csv")
View(Dataset)

# Impute missing values using mean
Dataset$Age <- ifelse(is.na(Dataset$Age),
                      ave(Dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                      Dataset$Age)

Dataset$Salary <- ifelse(is.na(Dataset$Salary),
                         ave(Dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                         Dataset$Salary)

# Encode categorical variables
Dataset$Country <- factor(Dataset$Country,
                          levels = c("France", "Spain", "Germany"),
                          labels = c(1.0, 2.0, 3.0))

Dataset$Purchased <- factor(Dataset$Purchased,
                            levels = c("No", "Yes"),
                            labels = c(0, 1))

View(Dataset)