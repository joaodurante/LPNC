distancia_sol(mercurio, 36).
distancia_sol(venus, 67).
distancia_sol(terra, 93).
distancia_sol(marte, 141).
distancia_sol(jupiter, 484).
distancia_sol(saturno, 886).
distancia_sol(uranio, 1790).
distancia_sol(netuno, 2800).
distancia_sol(plutonio, 4600).

distancia_planetas(P1, P2, Dist):-
	sun_distance(P1, Dist1),
	sun_distance(P2, Dist2),
	X is Dist1-Dist2,
	Dist is X*(-1).
