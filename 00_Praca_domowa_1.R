# Napisz funckjÄ™, ktĂłra bÄ™dzie obliczaÄ‡ wartoĹ›Ä‡ pierwiastka metodÄ… iteracyjnych przybliĹĽeĹ„.
#
#
# 
# Algorytm dziaĹ‚a natÄ™pujÄ…co:
# x - wartoĹ›Ä‡ do spierwiastkowania
# prec - oczekiwana precyzja przebliĹĽenia wartoĹ›ci
# 1. Jako poczÄ…tkowe przybliĹĽenie (est) przyjmij jakÄ…Ĺ› dodatniÄ… wartoĹ›Ä‡ 
# 2. v = x / est
# 3. Nowe est = (v + est) / 2
# 4. JeĹĽeli rĂłĹĽnica miÄ™dzy starÄ… i nowÄ… wartoĹ›ciÄ… est jest wiÄ™ksza niĹĽ prec, wrĂłc do kroku 2
# 5. W innym przypadku zwrĂłÄ‡ nowÄ… wartoĹ›Ä‡ est, jako przybliĹĽenie wartoĹ›ci pierwiastka x
#
#
#
#
# Np.
# dla x = 16
# przyjmijmy est = 1, prec = 0.001
# Iteracja 1:
#  v = 16/1 = 16
#  nowa est = (16+1)/2 = 8.5
#  rĂłĹĽnica 7.5 - wiÄ™ksza niĹĽ 0.001, wiÄ™c robimy kolejny krok
# Iteracja 2:
#  v = 16/8.5 = ~1.8823
#  nowa est = (~1.8823+8.5)/2 = ~5.1911
#  rĂłĹĽnica ~3.3088 - wiÄ™ksza niĹĽ 0.001, wiÄ™c robimy kolejny krok
# Iteracja 3:
#  v = 16/~5.1911 = ~3.0822
#  nowa est = (~3.0822+~5.1911)/2 = ~4.1367
#  rĂłĹĽnica ~1.0545 - wiÄ™ksza niĹĽ 0.001, wiÄ™c robimy kolejny krok
# Iteracja 4:
#  v = 16/~4.1367 = ~3.8679
#  nowa est = (~3.8679+~4.1367)/2 = ~4.0023
#  rĂłĹĽnica ~0.1344 - wiÄ™ksza niĹĽ 0.001, wiÄ™c robimy kolejny krok
# Iteracja 5:
#  v = 16/~4.0023 = ~3.9977
#  nowa est = (~3.9977+~4.0023)/2 = ~4.0000006
#  rĂłĹĽnica ~0.0023 - wiÄ™ksza niĹĽ 0.001, wiÄ™c robimy kolejny krok
# Iteracja 6:
#  v = 16/~4.0000006 = ~3.9999994
#  nowa est = (~3.9999994+~4.0000006)/2 = ~4.00000000000005
#  rĂłĹĽnica ~0.0000006 - mniejsza niĹĽ 0.001, koĹ„czymy
# zwracamy ~4.00000000000005 jako wartoĹ›Ä‡ pierwiastka z 


pierwiastek <- function(x, est = 1, prec = 0.001){
  # Wasz kod
  # sprawdzam czy wprowadzona wartosc jest dodatnia
  if(x<0) {
    wynik<- 'bledne dane wejsciowe'
  } 
  else{
    tempOld<- 0
    tempEst<- 0
    v<-0
    i<-1
    wynik<-0.0
    #jesli wprowadzone est ie jest 1 to ustawiam jako 1
    if (est != 1){
      est<- 1
    }
    repeat{
      
      v<-(x/est)
      #przypisuje biezae est do zmiennej tymczasowej
      tempOld <-est
      #obliczam nowe est
      est  <- ((v + est) / 2)
      #sprawdzam czy rozniczmiedzy nowym a starym est jest mniejsza od precyzji
      if(abs((est - tempOld)) < prec){
        #jesli roznica jest mniejsza est przypisuje do zmiennej wynik
        # przerywam petle
        wynik <-est
        break
      }
    }
  }
  
  return(wynik);
}
print(paste("wynik_ =   ", pierwiastek(-9,1,0.001)))
print(paste("wynik_ =   ", pierwiastek(9,1,0.001)))
print(paste("wynik_ =   ", pierwiastek(16,1,0.001)))
print(paste("wynik_ =   ", pierwiastek(25,1,0.001)))
print(paste("wynik_ =   ", pierwiastek(81,1,0.001)))
print(paste("wynik_ =   ", pierwiastek(125,1,0.001)))
print(paste("wynik_ =   ", pierwiastek(4096,1,0.001)))
