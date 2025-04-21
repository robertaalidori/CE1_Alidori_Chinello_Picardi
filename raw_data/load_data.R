---
  title: "Multivariate Analysis_Class Exercise 1"
subtitle: "Raw dataset"
---
  
  # Set up workingplace
  ```{r} 
# Set up R (show the R code in the final document, hide warnings and suppress messages from packages) 
knitr::opts_chunk$set(echo = TRUE, warning = FALSE, message = FALSE)
```
```{r} 
#Load packages
library(tidyverse)
library(readr)
```
#Load data

```{r} 

#Load ESS9
ESS9 <- read_csv("raw_data/ESS9.csv")
View(ESS9)


```

