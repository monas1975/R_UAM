library(dplyr)
###################################################
### Zadanie DPLYR1
###################################################

# Oblicz:
# - Ĺ›redniÄ… wagÄ™
# - Ĺ›rednie spalanie w litrach na 100 kilometrĂłw
# dla samochodĂłw majÄ…cych co najmniej 6 cylindrĂłw.
# JeĹĽeli nie wiesz w ktĂłrej kolumnie podana jest waga
# oraz liczba cylindrĂłw, skorzystaj z dokumentacji
# datasetu mtcars.

?mtcars # opis kolumn 

?mtcars

###################################################
### select - wybranie kolumn i usuniÄ™cie reszty
### select(dataset, kolumna1, kolumna2, ...)
###################################################
?select

data = as_tibble(mtcars) 
data = bind_cols(name = row.names(mtcars), data) 

data 

data = mtcars %>%
  tibble::rownames_to_column('car_model') %>%
  tibble::as_tibble()

data %>%
  mutate(kpl = 0.4251 * mpg) %>% # tworzymy kolumnÄ™ zawierajÄ…cÄ… przeliczenie mil na galon, na kilometry na litr
  View()

data %>%
  mutate(kpl = 0.4251 * mpg,
           lp100 = 100 / kpl) %>%        
  filter(cyl >= 6) %>%
  summarise(
    mean_wt = mean(wt), # srednia waga
    mean_lp100 = mean(lp100) #srednia spalanie l/100km
  )




# oczekiwany wynik:

# A tibble: 1 x 2
#   mean_wt mean_lp100
#     <dbl>      <dbl>
# 1    3.71       14.7

