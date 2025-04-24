library(dplyr)
library(tidyverse)

# Load dataset
ESS9_clean <- read_csv("02_recoded_data/ESS9_clean.csv")

# Exploratory data analysis
# Check the structure of the dataset
str(ESS9_clean)


# Bar chart of happy_group
ggplot(ESS9_clean, aes(x = fct_infreq(happy_group))) +
  geom_bar(fill = "green", 
           color = "black", 
           alpha = 0.7) +
  labs(title = "Bar Chart of Happiness Level",
       x = "Level of Happiness",
       y = "Number of people") +
  theme_minimal()

# Saving the plot
ggsave("04_plots/happy_group_bar_chart.png", 
       width = 8, height = 6, dpi = 300)


# Bar chart of wealth discrepancy
ggplot(ESS9_clean, aes(x = fct_infreq(wealth))) +
  geom_bar(fill = "green", 
           color = "black", 
           alpha = 0.7) +
  labs(title = "Bar Chart of Wealth",
       x = "Level of Wealth discrepancy",
       y = "Number of people") +
  theme_minimal()

# Saving the plot
ggsave("04_plots/wealth_bar_chart.jpeg", 
       width = 8, height = 6, dpi = 300)



#Graph of the association between wealth discrepancies and happiness

ggplot(ESS9_clean, aes(x = wealth, fill = happy_group)) +
  geom_bar(position = "fill") +
  labs(title = "Association between Wealth Discrepancies and Happiness",
       x = "Wealth Discrepancy",
       y = "Proportion of Happiness Level") +
  scale_fill_brewer(palette = "Set4") +
  theme_minimal()

#Saving the plot
ggsave("04_plots/wealth_happiness_association.jpeg", 
       width = 8, height = 6, dpi = 300)




#regression with control variables to make the analysis more robust

lm(happy ~ wltdffr + gndr + agea, data = ESS9)

#ADD ON: regression for control variables 

control_var <- lm(happy ~ wltdffr + gndr + agea + eduyrs, data = ESS9)
control_var

# Load necessary libraries
library(broom)

# control_var plot

tidy(control_var, conf.int = TRUE) |> 
  filter(term != "(Intercept)") |> 
  ggplot(aes(x = term, y = estimate)) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.2) +
  labs(
    title = "Effect of predictors on happiness",
    x = "Predictors",
    y = "Estimated effect (with 95% CI)"
  ) +
  theme_minimal()

ggsave("04_plots/control_var_plot.jpeg", 
       width = 8, height = 6, dpi = 300)

#it's clear that wealth and education have a statistically significant effect on happiness
