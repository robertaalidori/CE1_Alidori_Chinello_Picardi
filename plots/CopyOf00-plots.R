library(dplyr)
library(tidyverse)

# Load dataset
ESS9_clean <- read_csv("recoded_data/ESS9_clean.csv")

# Exploratory data analysis
# Check the structure of the dataset
str(ESS9_clean)


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



#ADD ON: regression for control variables 

control_var <- lm(happy ~ wltdffr + gndr + agea + eduyrs, data = ESS9)
control_var


library(broom)

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



