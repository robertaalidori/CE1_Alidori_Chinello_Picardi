

library(dplyr)

#descriptive statistic 

#I don't think using summary is the best way to inspect categorical variables (it doesn't really make sense to have an average of a variable that is not numeric)
# I think it is better to use:

# Frequency health
hn <- table(ESS9_clean$happy)
hn
#Proportion health
hp <- prop.table(hn) 
hp
# Putting the two together health
ht  <- cbind(hn, hp)
ht
# Frequency wealth
wn <- table(ESS9_clean$wealth)
wn
#Proportion wealth
wp <- prop.table(wn) 
wp
# Putting the two together health
wt  <- cbind(wn, wp)
wt
#table 

table(ESS9_clean$wealth, ESS9_clean$happy_group)

#distribution of population across wealth fairness and subjective happiness 

# percentages

ESS9_clean |>
  count(wealth, happy_group) |> 
  mutate(
    perc_on_total = round(100 * n / sum(n), 1)
    ) |>
  arrange(desc(perc_on_total))



#chisquare 


table_chisq <- table(ESS9_clean$wealth, ESS9_clean$happy_group)
table_chisq


# Test
chisq.test(table_chisq)

#we find out that there's a significant association 



#means comparison within each category of wealth for the estimates precision

ESS9_clean |>
  group_by(wealth) |>
  summarise(
    mean_happy = mean(happy),
    sd = sd(happy),
    n = n(),
    se = sd / sqrt(n),
    ci = 1.96 * se
  )


#regression with control variables to make the analysis more robust

lm(happy ~ wltdffr + gndr + agea, data = ESS9)


#graph? 

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

#it's clear that wealth and education have a statistically significant effect on happiness


