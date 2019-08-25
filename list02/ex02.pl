pais(etiopia).
pais(brasil).
pais(peru).
pais(colombia).
pais(portugal).
pais(china).
pais(espanha).
pais(franca).
pais(turquia).
pais(angola).

oceano(atlantico).
oceano(mediterraneo).
oceano(pacifico).

continente(europeu).
continente(asiatico).
continente(africano).
continente(americano).

fronteira(brasil, peru).
fronteira(colombia, pacifico).
fronteira(portugal, espanha).
fronteira(franca,espanha).
fronteira(brasil,colombia).
fronteira(peru,colombia).
fronteira(brasil,atlantico).
fronteira(portugal,atlantico).
fronteira(turquia,mediterraneo).
fronteira(angola,mediterraneo).
fronteira(china,pacifico).
fronteira(peru,pacifico).

loc(brasil, americano).
loc(colombia, americano).
loc(peru, americano).
loc(portugal,europeu).
loc(franca,europeu).
loc(espanha,europeu).
loc(alemanha,europeu).
loc(inglaterra,europeu).
loc(turquia,asiatico).
loc(china,asiatico).
loc(angola,africano).
loc(etiopia,africano).

clausula1(X):-
	loc(X, europeu),
	fronteira(X, Y),
	oceano(Y).

clausula2(A,B):-
	fronteira(A,B),
	fronteira(A, OceanoA),
	oceano(OceanoA),
	fronteira(B, OceanoB),
	oceano(OceanoB),
	not(fronteira(A, OceanoB)),
	not(fronteira(B, OceanoA)).

clausula3(A,B):-
	loc(A, ContA),
	loc(B, ContB),
	fronteira(A, Oceano),
	fronteira(B, Oceano),
	ContA \= ContB.