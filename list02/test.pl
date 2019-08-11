pais(etiopia).
pais(brasil).
pais(peru).
pais(colombia).

oceano(atlantico).
oceano(mediterraneo).
oceano(pacifico).

continente(europeu).
continente(asiatico).
continente(africano).

fronteira(portugal,franca).
fronteira(china,franca).
fronteira(franca,espanha).
fronteira(brasil,colombia).
fronteira(peru,colombia).
fronteira(brasil,atlantico).
fronteira(portugal,atlantico).
fronteira(turquia,mediterraneo).
fronteira(franca,mediterraneo).
fronteira(angola,mediterraneo).
fronteira(china,pacifico).
fronteira(peru,pacifico).

loc(portugal,europeu).
loc(franca,europeu).
loc(espanha,europeu).
loc(alemanha,europeu).
loc(inglaterra,europeu).
loc(turquia,asiatico).
loc(china,asiatico).
loc(angola,africano).
loc(etiopia,africano).

hasOcean(X):-
	fronteira(X, Z),
	oceano(Z).

hasOceanInEurope(X):-
	hasOcean(X),
	loc(X, europeu).
	

border(A,B):-
	fronteira(A,B),
	(fronteira(A, OceanA), oceano(OceanA)),
	(fronteira(B, OceanB), oceano(OceanB), not(OceanA)).
	







