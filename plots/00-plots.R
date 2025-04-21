library(dplyr)
library(tidyverse)

# Load dataset
ESS9_recoded <- read_csv("recoded_data/ESS9_recoded.csv")

#Exploratory data analysis
# Check the structure of the dataset
str(ESS9_recoded)

# Check for missing values
missing_values <- colSums(is.na(ESS9_recoded))
print(missing_values)

#Histogram happy
ggplot(ESS9_recoded, aes(x = happy)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Happiness Levels",
       x = "Happiness Level",
       y = "Frequency") +
  theme_minimal()


#Histogram wealth_diff
ggplot(ESS9_recoded, aes(x = wealth_diff)) +
  geom_histogram(binwidth = 1, fill = "green", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Wealth Difference",
       x = "Wealth Difference",
       y = "Frequency") +
  theme_minimal()




#regression
regression <- lm(happy ~ wealth_diff, data = ESS9_recoded)
summary(regression)
# Plot the regression line
ggplot(ESS9_recoded, aes(x = wealth_diff, y = happy)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Regression of Happiness on Wealth Difference",
       x = "Wealth Difference",
       y = "Happiness Level") +
  theme_minimal()
