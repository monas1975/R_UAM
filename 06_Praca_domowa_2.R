# Wykorzystując bazę SQLite zawartą pliku 'homework.db' oblicz MEDIANĘ liczby przylotów
# i odlotów na lotnisku w Los Angeles w każdym z 12 miesięcy w roku.
# Następnie zapisz wynik do pliku CSV. (oczekiwany wynik masz w pliku 06_Praca_domowa_2_wynik.csv)
#
# Zwróc uwagę, że dla każdego miesiąca masz podane informacje o kilku rodzajów lotów. Należy
# więc je wstępnie zsumować.

library(DBI)
library(RSQLite)
library(dplyr)
library(lubridate)

drv <- dbDriver("SQLite")

con <- dbConnect(drv, "06_Praca_domowa_2_homework.db", flags = SQLITE_RO) # połączenie w trybie tylko do odczytu, aby przypadkiem nie zmodyfikować zawartości bazy

dbGetQuery(con, 'SELECT * FROM flights')
#dbGetQuery(con, 'SELECT ReportPeriod  FROM flights')

flights_from_db = tbl(con, 'flights') %>%
  collect()

# Step 1: Konwersja daty
flights_from_db$ReportPeriod <- as.Date(flights_from_db$ReportPeriod, "%m/%d/%Y") 


# Step 2: grupowanie (po Report_Period,Arival_Departura) i sumowanie danych (FlightOpsCount)
require(dplyr)
flights_from_db <- flights_from_db %>% 
  group_by(ReportPeriod,Arrival_Departure) %>%
  summarise(groupby_FlightCount = sum(FlightOpsCount))

#step3 modyfikacja tabeli- wprowadzenie dodatkowych kolumne - miesiac i miesiac za pomoca liczby

flights_from_db <-flights_from_db %>% mutate(month = months(as.Date(ReportPeriod,"%m/%d/%y")))%>%
  mutate(month_decimal=month(as.Date(ReportPeriod,"%m/%d/%y")))

#step4 - grupowanie (po miesiac, miesiac jako liczba, a nastepnie Arrival_Departure), nastepnie wylicznie mediany
#ze zmiennej groupby_FlightCount (obliczonej w step2) i na koniec sortowanie rosnaco po miesiac.
flights_from_db <- flights_from_db %>% group_by(month, month_decimal,Arrival_Departure)%>%
  summarise(FlightOpsCount=median(groupby_FlightCount)) %>%arrange(month_decimal)

#step5, przygotawanie danych do zapisu, wyborkolumn
to_be_written = subset(data.frame(flights_from_db),select = c(month,Arrival_Departure,FlightOpsCount))

#step 6 zapis do pliku
 write.csv(to_be_written,"06_Praca_domowa_2_wynik_csv.csv")

# oczekiwany wynik:
#readr::read_csv('06_Praca_domowa_2_wynik.csv')
