imc():-
	write("Weight:"),
	nl,
	read(X),
	nl,
	write("Height:"),
	read(Y),
	Z is Y*Y,
	Imc is X/Z,
	write(Imc).
