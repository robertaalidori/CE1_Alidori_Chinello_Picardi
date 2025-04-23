title()

library(dplyr)

#descriptive statistic (average and so on)

summary(ESS9_clean$happy)
summary(ESS9_clean$wealth)

#table 

table(ESS9_clean$wealth, ESS9_clean$happy_group)

#distribution of population across wealth fairness and subjective happiness

ESS9_clean |>
  filter(!is.na(wealth), !is.na(happy_group)) |>
  count(wealth, happy_group) |> 
  mutate(
    perc_on_total = round(100 * n / sum(n), 1)
    ) |>
  arrange(desc(perc_on_total))

#check for NAs

total_rows <- nrow(ESS9_clean)
na_rows <- sum(is.na(ESS9_clean$wealth) | is.na(ESS9_clean$happy_group))
valid_rows <- total_rows - na_rows
perc_na <- round(100 * na_rows / total_rows, 2)

cat("Totale righe:", total_rows, "\n")
cat("Righe con NA rimosse:", na_rows, "\n")
cat("Percentuale di NA:", perc_na, "%\n")

#RESULT NA: 0 


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

control_var <- lm(happy ~ wltdffr + gndr + agea, data = ESS9)


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

#it's clear that only wealth has a statistically significat effect on happiness


