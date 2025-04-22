library(dplyr)
library(tidyverse)

# Load dataset
read_csv("recoded_data/ESS9_clean.csv")

# Exploratory data analysis
# Check the structure of the dataset
str(ESS9_recoded)


# Bar chart of happy_group
ggplot(ESS9_clean, aes(x = fct_infreq(happy_group))) +
  geom_bar(fill = "blue", 
           color = "black", 
           alpha = 0.7) +
  labs(title = "Bar Chart of Happiness Level",
       x = "Level of Happiness",
       y = "Number of people") +
  theme_minimal()

# Saving the plot
ggsave("plots/happy_group_bar_chart.png", 
       width = 8, height = 6, dpi = 300)


# Bar chart of wealth
ggplot(ESS9_clean, aes(x = fct_infreq(wealth))) +
  geom_bar(fill = "green", 
           color = "black", 
           alpha = 0.7) +
  labs(title = "Bar Chart of Wealth",
       x = "Level of Wealth",
       y = "Number of people") +
  theme_minimal()

# Saving the plot
ggsave("plots/wealth_bar_chart.png", 
       width = 8, height = 6, dpi = 300)




