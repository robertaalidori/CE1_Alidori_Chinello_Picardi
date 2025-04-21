

library(dplyr)

#statistiche base 

summary(da_ESS9$happy)
summary(da_ESS9$wealth)

#tabella dati 
table(da_ESS9$wealth, da_ESS9$happy_group)

#media "happy" con "wealth"

da_ESS9 |>
  filter(!is.na(wealth), !is.na(happy_group)) |>
  count(wealth, happy_group) |> 
  mutate(
    perc_on_total = round(100 * n / sum(n), 1)
    ) |>
  arrange(desc(perc_on_total))

#ci sono molti NA quindi vediamo quanti sono, anche se li ho già eliminati. Se sono tanti, cerchiamo di capire se includerli. 

total_rows <- nrow(da_ESS9)
na_rows <- sum(is.na(da_ESS9$wealth) | is.na(da_ESS9$happy_group))
valid_rows <- total_rows - na_rows
perc_na <- round(100 * na_rows / total_rows, 2)

cat("Totale righe:", total_rows, "\n")
cat("Righe con NA rimosse:", na_rows, "\n")
cat("Percentuale di NA:", perc_na, "%\n")

#RISULTATO NA: sono 7,09% delle righe, quindi accettabile, credo. 


# regression 

happiness_by_inequality <- lm(happy ~ wltdffr, data = da_ESS9)
summary(happiness_by_inequality)


#graph 


library(ggplot2)

ggplot(da_ESS9, aes(x = wltdffr, y = happy)) +
  geom_jitter(width = 0.2, height = 0.2, alpha = 0.3) +
  geom_smooth(happiness_by_inequality = "lm", se = TRUE, color = "blue") +
  labs(
    x = "Perceived unfairness of wealth distribution",
    y = "Happiness (0–10)",
    title = "Linear regression: Happiness ~ Perceived Inequality"
  )

#con il graph è chiaro che nelle variabili ci sono ancora i valori 77, 88, 99, che nella survey indicano valori che non rientrano nei parametri 1-5!






