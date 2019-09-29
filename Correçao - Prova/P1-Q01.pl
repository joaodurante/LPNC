% empregado (NumEmp, NomeEmp, NumDepto).
empregado(32,jSilva,21).
empregado(74,mReis,25).
empregado(89,cMelo,28).
empregado(92,rSilva,25).
empregado(112,rPinto,21).
empregado(121,vSimao,28).
empregado(130,jNeves,28).

% salario (NumEmp, Salario).
salario(32,380.07).
salario(74,400.26).
salario(89,520.73).
salario(92,480.82).
salario(112,390.17).
salario(121,905.04).
salario(130,640.58).

% departamento (NumDepto, NomeDepto).
departamento(21, pessoal).
departamento(25, financeiro).
departamento(28, tecnico).

% ramal(NumDepto,Ramal).
ramal(21,142).
ramal(25,143).
ramal(28,144).


% a)Crie uma cláusula em Prolog que fornecido o NomeEmp, ele devolva o NomeDepto e seu Ramal. 
consulta01(Empregado,Departamento,Ramal):-
	empregado(_,Empregado,NumDepto),
	departamento(NumDepto,Departamento),
	ramal(NumDepto,Ramal).

% b) Crie uma cláusula em Prolog que fornecido o NomeDepto, devolva a lista dos Empregados com seus respectivos salários
consulta02(Depto,Empregados):-
	findall([Empregado,Sal],
		(empregado(NumEmp,Empregado,NumDepto),
		 salario(NumEmp,Sal),
		 departamento(NumDepto,Depto)), Empregados).

% c) Crie uma cláusula em Prolog que devolva o gasto total da empresa com funcionários.
consulta03(ValorTotal):-
	findall(Salario,salario(_,Salario),Salarios),
	soma(Salarios,ValorTotal).

soma([],0).
soma([Sal|Salarios],ValorTotal):-
	soma(Salarios,Valor),
	ValorTotal is Valor + Sal.
