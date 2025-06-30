# Clear environment
rm(list = ls())

# Install and load required package
install.packages("caTools")
library(caTools)

# Generate synthetic data
set.seed(0)
Dataset <- data.frame(
  x1 = rnorm(500), x2 = rnorm(500), x3 = rnorm(500),
  x4 = rnorm(500), x5 = rnorm(500), x6 = rnorm(500),
  x7 = rnorm(500), x8 = rnorm(500), x9 = rnorm(500),
  x10 = rnorm(500), x11 = rnorm(500), x12 = rnorm(500),
  x13 = rnorm(500), x14 = rnorm(500), x15 = rnorm(500),
  x16 = rnorm(500), x17 = rnorm(500), x18 = rnorm(500),
  x19 = rnorm(500), x20 = rnorm(500), x21 = rnorm(500),
  x22 = rnorm(500), x23 = rnorm(500), x24 = rnorm(500),
  x25 = rnorm(500), x26 = rnorm(500), x27 = rnorm(500),
  x28 = rnorm(500), x29 = rnorm(500), x30 = rnorm(500)
)

# Save as CSV
write.csv(Dataset, file = "RW9.csv")
View(Dataset)
