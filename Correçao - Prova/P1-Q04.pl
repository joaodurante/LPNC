/*
ordena ([],[]).
ordena ([Cab|Cauda],Lista_ord):-
              ordena (Cauda,Cauda_ord),
              ordena2 (Cab,Cauda_ord,Lista_ord).
ordena2 (X,[Y|Cauda_ord1],[Y|Cauda_ord2]):-
              X>Y, !, ordena2 (X,Cauda_ord1,Cauda_ord2).
ordena2 (X,Cauda_ord,[X|Cauda_ord]).       

*/


insertionsort([],[]).
insertionsort([Cab|Cauda],Lista_ord):-
              insertionsort(Cauda,Cauda_ord),
              insira(Cab,Cauda_ord,Lista_ord).
              
insira(X,[Y|Cauda_ord1],[Y|Cauda_ord2]):-
       X > Y,!,insira(X,Cauda_ord1,Cauda_ord2).
insira(X,Cauda_ord,[X|Cauda_ord]).       






                               
