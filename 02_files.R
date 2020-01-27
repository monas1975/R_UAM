###################################################
### Zadanie READR1
###################################################

### Z pliku https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv
### wczytaj kolumny:
### - model - jako ciÄ…g znakĂłw
### - mpg - jako liczbÄ™ zmiennoprzecinkowÄ…
### - cyl - jako liczbÄ™ zmiennoprzecinkowÄ…
### - hp - jako liczbÄ™ caĹ‚kowitÄ…
### - carb - jako ciÄ…g znakĂłw
### PozostaĹ‚e kolumny pomiĹ„.
### NastÄ™pnie:
### - dodaj do tego kolumnÄ™ "x" o treĹ›ci "xxx" w kaĹĽdym wierszu
### - zapisz otrzymany data.frame do pliku

library(readr)

file<-"https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv"
dataRead = read_csv(file, col_types = cols_only( # cols_only - pomiĹ„ kolumny, ktĂłre nie zostaĹ‚y wymienione
  model = col_character(),
  mpg = col_double(),
  cyl = col_double(),
  hp =col_integer(),
  carb=col_character()
))
dataRead
dataRead$x="xxx"
dataRead
#setwd('D:\UAM_BigData\R\Programy\RStudioexe') # zmienia folder roboczy na podfolder 'example' (bo podana Ĺ›cieĹĽka jest wzglÄ™dna)
write_csv(dataRead, "D:/UAM_BigData/R/Programy/RStudio_exercises/dataRead.csv") 
getwd()