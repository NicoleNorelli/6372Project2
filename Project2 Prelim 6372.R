library(tidyverse)
library(naniar)

############# Adutl Data Set ##############
# adult.data file
adult = read_csv("/Users/nicolenorelli/Downloads/adult.data.csv")
summary(adult)
# 32560 obs of 15 variables

# make '<=50K' a factor to see how imbalanced the response is
adult$`<=50K`= factor(adult$`<=50K`)
summary(adult$`<=50K`)
# 24719:7841 so approx 3:1

# of note: this data is pre-split.  There are 16281 obs in the adult.test

# missing data
sapply(adult, function(x) sum(x %in% common_na_strings)) # missing values using other than NA
sapply(adult, function(x) sum(x %in% common_na_numbers)) # missing values using other than NA
sapply(adult, function(x) sum(is.na(x)))
sapply(adult, function(x) sum(x %in% '?'))
# there we go.  NA's as '?' - 1836 in state-gov, 1843 in adm-clerical, 583 in US


#################### Bone Data Set ######################
#install.packages('aplore3')
library(aplore3)
?glow_bonemed
# 500 rows of 18 variables
summary(glow_bonemed)
# fracture: 375:125 so 3:1

# missing data
sapply(adult, function(x) sum(is.na(x)))
# need to re-check, but I don't think this is missing any data


################# Bank Data Set ###########################
# The Bank+Marketing Dataset is more imbalanced
# bank.full.csv file
bank.full <- read.csv("~/Downloads/bank/bank-full.csv", sep=";")
# 45211 obs of 17 variables
bank.full$y = factor(bank.full$y)
summary(bank.full$y)
# 39922:5289 so 7.5:1

# missing data
sapply(bank.full, function(x) sum(x %in% common_na_strings)) # missing values using other than NA
sapply(bank.full, function(x) sum(x %in% common_na_numbers)) # missing values using other than NA
sapply(bank.full, function(x) sum(is.na(x)))
sapply(bank.full, function(x) sum(x %in% 'unknown'))
# missing in job, education, contact, and majority of poutcome