# analysis

#library

library(dplyr)

#descriptive statistic 

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

#cross-table 

table(ESS9_clean$wealth, ESS9_clean$happy_group)


#distribution of population across wealth fairness and subjective happiness by percentages 

ESS9_clean |>
  count(wealth, happy_group) |> 
  mutate(
    perc_on_total = round(100 * n / sum(n), 1)
    ) |>
  arrange(desc(perc_on_total))



#chi-square 


table_chisq <- table(ESS9_clean$wealth, ESS9_clean$happy_group)
table_chisq


# association test: chi-test

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

# Although low, education has a statistically significant effect on happiness


