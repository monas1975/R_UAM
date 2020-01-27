###################################################
### Zadanie POD1
###################################################

### Napisz funkcję fibonacci(n), zwracającą n-ty
### element ciągu fibonacciego, w oparciu
### podejście rekurencyjne.
### Przyjmij, że:
### - dla n == 0 wartość wynosi 0
### - dla n == 1 wartość wynosi 1
### - dane wejsciowe są prawidłowe

fib<-function(n){
  if(n<2)
    temp<- 1
  else temp<- fib(n-2)+fib(n-1)
  
  return(temp)
}

x=fib(5)
x
x=fib(10)
x
x=fib(20)
x

###################################################
### Zadanie POD2
###################################################

### Napisz funkcję fibonacci_series(n), zwracającą
### n pierwszych elementów ciągu fibonacciego.
### Wykorzystaj podejście oparte o programowanie
### dynamiczne.
### Przyjmij, że:
### - dla n == 1 wartość wynosi 1
### - dla n == 2 wartość wynosi 1
### - n jest nie mniejsze niż 1
### - dane wejsciowe są prawidłowe





#funkcja tworzaca ciąg fibonacciego metoda iteracyjna
fib2<-function(n){
  for (i in 1:n) {
    if(i==1){
      temp<-1
    } 
    else if (i==2){
      temp<- c(temp,1)
    }
    else {
      temp<- c(temp,temp[i-2]+temp[i-1])
    }
  }
  
  return(temp)
}


#funkcja wypisujca elementy wektorq
piszWektor<-function(wektor){
  
  for(i in 1:length(wektor)){
    print(paste(i, "element =      ",wektor[i]))
  }
  
}

#wywolanie funkcji
piszWektor(fib2(20))

