% cliente(CodCli,Nome,CNH,Endereco).
% telefone(Telefone_PK, Telefone,CodCli).
% aluga(CodAlu, DataInicial, DataFinal, CodCar,CodCli).
% carro(CodCar,Placa,Cor,Modelo,Ano,Diaria).
% esportivo(CodCar,Velocidade).
% sedan(CodCar,Passageiro).

:-dynamic cliente/4.
:-dynamic telefone/3.
:-dynamic aluga/5.
:-dynamic carro/6.
:-dynamic esportivo/2.
:-dynamic sedan/2.


menu:- nl,
	write('Escolha uma opcao: '),nl,
	write('1. Carrega o arquivo'),nl,
	write('2. Adiciona um cliente'),nl,
	write('3. Adiciona um telefone do cliente'),nl,
	write('4. Adiciona um pedido de aluguel'),nl,
	write('5. Adiciona um carro'),nl,
	write('6. Salva o Banco de Dados em um arquivo'),nl,
	write('7. Termina. '),nl,
	write(' '),nl,
	read(Escolha),
	processa(Escolha), 
	menu.

processa(1):- carrega.
processa(2):- adiciona_cliente.
processa(3):- adiciona_telefone.
processa(4):- adiciona_aluga.
processa(5):- adiciona_carro.
processa(6):- salva.
processa(7):- write('Tem certeza que deseja terminar?(s/n)'),
	      read(Resposta),Resposta=='s',nl,
	      write('Terminado!'),abort.
processa(7):- menu.


processa(Escolha):- Escolha < 1, erro.
processa(Escolha):- Escolha > 7, erro.
erro:- write('Por favor entre numeros entre 1 e 7.'),
	nl,write('Tecle 0 para continuar.'),read(_).

adiciona_cliente:-true.
adiciona_aluga:- true.
adiciona_carro:-true.

% cliente(CodCli,Nome,CNH,Endereco).
% telefone(Telefone_PK, Telefone,CodCli).
adiciona_telefone:-
	write('digite o ID_Telefone: '), read(Telefone_PK),
	not(telefone(Telefone_PK, _, _)),
	write('digite o Codigo do Cliente: '), read(CodCli),
	cliente(CodCli,_,_,_),
	write('digite o telefone: '), read(Telefone),
	assertz(telefone(Telefone_PK, Telefone,CodCli)).
adiciona_telefone:- write('Nao foi possivel inserir').

carrega:- write('Carregando o arquivo com o B D.'),nl,
	  exists_file('p1q06.txt'),
	  consult('p1q06.txt'),
	  write('Carregado!'),nl.
carrega:- write('Nao existe').
salva:-	tell('p1q06.txt'), 
 	listing(cliente),
	listing(telefone),
	listing(aluga),
	listing(carro),
	listing(esportivo),
	listing(sedan),
	told.


