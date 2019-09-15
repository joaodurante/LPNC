% adaptado de www2.unemat.br/rhycardo/download/apostila_de_prolog.pdf

:-dynamic agenda/2.

menu:- nl,
	write('Escolha uma opcao: '),nl,
	write('1. Adiciona um telefone ao Banco de Dados'),nl,
	write('2. Deleta um telefone do Banco de Dados'),nl,
	write('3. Procura um telefone'),nl,
	write('4. Carrega o arquivo do Banco de Dados'),nl,
	write('5. Salva o Banco de Dados em um arquivo'),nl,
	write('6. Imprimir todos os nomes/telefones guardados na agenda'), nl,
	write('7. Termina. '),nl,
	write(' '),nl,
	read(Escolha),
	processa(Escolha), 
	menu.

processa(1):- adiciona.
processa(2):- deleta.
processa(3):- procura.
processa(4):- carrega.
processa(5):- salva.
processa(6):- imprimir.
processa(7):- write('Tem certeza que deseja terminar?(s/n)'),
	      read(Resposta),Resposta=='s',nl,
	      write('Terminado!'),abort.
processa(7):- menu.


processa(Escolha):- Escolha < 1, erro.
processa(Escolha):- Escolha > 7, erro.
erro:- write('Por favor entre numeros entre 1 e 7.'),
	nl,write('Tecle 0 para continuar.'),read(_).

imprimir:-
	listing(agenda).

adiciona:- 
	write('Adicionando um telefone ao B D.'),nl,
	write('Entre o nome: '),read(Nome),
	write('Entre o telefone dele:'),read(Telefone),
	assertz(agenda(Nome,Telefone)),
	write('Telefone adicionado ao B D.'),nl.


deleta:- write('Deletando um telefone do B D.'),nl,
	write('Entre o nome: '),read(Nome),
	write('Entre o telefone dele: '),read(Telefone),
	retract(agenda(Nome,Telefone)),
	write('Telefone retirado do B D.'),nl.
deleta:- write('Telefone nao encontrado!!!'), nl.


procura:- 
	write('Procurando um telefone no B D.'),nl,
	write('Entre o nome: '),read(Nome),
	agenda(Nome, Telefone),
	format('O telefone do(a) ~w eh ~w.~n',[Nome,Telefone]).
procura:- write('Telefone nao encontrado!!!'), nl.


carrega:- 
	write('Carregando o arquivo com o B D.'),nl,
	write('Qual o nome do arquivo? '),
	read(Nome_do_arquivo),
	consult(Nome_do_arquivo),
	write('Carregado!'),nl.
carrega:- write('Arquivo nao existe'),nl.


salva:- write('Salvando o Banco de Dados.'), nl,
	write('Qual o nome do arquivo? '),
	read(Nome_do_arquivo),
	tell(Nome_do_arquivo),
	listing(agenda),
	told,
	write('Salvo!'),nl.
