% cliente(CodCli,Nome,CNH,Endereco).
cliente(1,mariaSilva,1111,'Rua 3, 56 - SP').
cliente(2,jairSouza,22222,'Rua 3A, 356 - SP').
cliente(3,veraCintra,33333,'Rua 3B, 526 - SP').
cliente(4,cristianeJabur,44444,'Rua 5, 16 - SP').
cliente(5,dalvaMoreira,55555,'Rua 5A, 891 - SP').

% telefone(Telefone_PK, Telefone,CodCli).
telefone(1,997155656,1).
telefone(2,987155447,2).
telefone(3,996472525,3).
telefone(4,984756572,4).
telefone(5,995149898,5).

% aluga(CodAlu, DataInicial, DataFinal, CodCar,CodCli).
aluga(1, data(1,1,2019), data(3,1,2019), 1, 1).
aluga(2, data(3,4,2019), data(7,4,2019), 1, 2).
aluga(3, data(5,5,2019), data(15,5,2019), 2, 3).
aluga(4, data(2,7,2019), data(22,7,2019), 1, 4).
aluga(5, data(7,8,2019), data(28,8,2019), 2, 5).

% carro(CodCar,Placa,Cor,Modelo,Ano,Diaria).
carro(1,bxf9800,prata,logan,2017,139.51).
carro(2,cdx7866,preto,duster,2018,240.82).

% esportivo(CodCar,Velocidade).
esportivo(2,200).

% sedan(CodCar,Passageiro).
sedan(1,5).

% I)	Dada a placa do carro, descobrir quantas vezes ele foi alugado 
%       (total) e para quais clientes (Nome, telefone e endereco).
consulta01(Placa):-
	carro(CodCar,Placa,_,_,_,_),
	findall([Nome,Telefone,Endereco],
		(aluga(_,_,_,CodCar,CodCli),
		cliente(CodCli,Nome,_,Endereco),
		telefone(_,Telefone,CodCli)),
		Lista),
	conta(Lista,ValorTotal),
	imprima_lista(Lista),
	format('Quantidade total de alugueis do carro de placa ~w: ~w',[Placa,ValorTotal]).

conta([],0).
conta([_|Cauda],S):-
	conta(Cauda,S1), S is S1+1.

imprima_lista([]).
imprima_lista([X|Cauda]):-
	format('O cliente ~w alugou o carro. Telefone: ~w. Endereco: ~w. ~n',X),
	imprima_lista(Cauda).

% II)	Sabendo todos os alugueis estão no BDD, calcule o valor que cada cliente gastou. 
%       Calcule também o valor que carro obteve.

consulta02:-
	findall([CodCli,CodCar,DataInicial, DataFinal,Diaria],
		(aluga(_, DataInicial, DataFinal, CodCar,CodCli),
		carro(CodCar,_,_,_,_,Diaria)),
		Lista),
	calcula_diarias(Lista,Lista1),
	imprima_valores(Lista1),
	write('Assim, cada carro teve: '),nl,
	write('Carro 1: R$'),soma_cat(1,Lista1,S1),write(S1),nl,
	write('Carro 2: R$'),soma_cat(2,Lista1,S2),write(S2).

calcula_diarias([],[]).
calcula_diarias([[CodCli,CodCar,data(Di,Mi,Ai),data(Df,Mi,Ai),Diaria]|Lista],
		    [[CodCli,CodCar,Valor]|Lista1]):-
		Valor is (Df-Di+1)*Diaria,
		calcula_diarias(Lista,Lista1).
soma_cat(_,[],0).
soma_cat(C,[[_,C,V]|Cauda], S):-
	soma_cat(C, Cauda, S1), 
	S is S1+V.
soma_cat(C,[_|Cauda], S):-
	soma_cat(C, Cauda, S1), 
	S is S1.

imprima_valores([]).
imprima_valores([[CodCli,_,V]|Cauda]):-
	Valor is V,
	format('O Cliente ~w pagou R$ ~w. ~n',[CodCli,Valor]),
	imprima_valores(Cauda).
