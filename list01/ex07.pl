	imc():-
		write("Weight:"),
		read(W),
		write("Height:"),
		read(H),
		nl,
		HH is H*H,
		Imc is W/HH,
		write(Imc),
		result(Imc, Result),
		nl,
		write(Result).

	result(X, 'Magreza grave'):- X < 16.
	result(X, 'Magreza moderada'):- X < 17.
	result(X, 'Magreza leve'):- X < 18.5.
	result(X, 'Saudavel'):- X < 25.
	result(X, 'Sobrepreso'):- X < 30.
	result(X, 'Obesidade grau I'):- X < 35.
	result(X, 'Obesidade grau II'):- X < 40.
	result(X, 'Obesidade grau III'):- X >= 40.
