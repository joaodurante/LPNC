/*  programa de busca em largura */

resolva:-
        estado_inicial(E),
        busca([[ramo(raiz,E)]],Solucao),
        imprima(Solucao).

busca([Solucao|_],Solucao):- atinge_meta(Solucao),!.
busca([T|Pilha],Solucao):- 
       ache_todos(Extensao,estende_ate_filho(T,Extensao),Extensoes),
       concatena(Extensoes,Pilha,Pilha_ext),
       busca(Pilha_ext,Solucao).

atinge_meta([ramo(_,M)|_]):-meta(M).

ache_todos(X,Y,Z):-findall(X,Y,Z),!.
ache_todos(_,_,[]).

estende_ate_filho([ramo(Ramo,N)|Trajetoria],
                  [ramo(Op,Filho),ramo(Ramo,N)|Trajetoria]):-
        transforma(N,Filho,Op),
        nao_produz_ciclos(Filho,Trajetoria).

nao_produz_ciclos(Estado,Trajetoria):-
        not(pertence(ramo(_,Estado),Trajetoria)).
        
pertence(X,[X|_]):-!.
pertence(X,[_|Y]):- pertence(X,Y).

concatena([],X,X):-!.
concatena([X|Y],Z,[X|W]):-concatena(Y,Z,W).

imprima([ramo(raiz,Raiz)]):- !, write('Estado inicial: '),write(Raiz),write('.').
imprima([ramo(Ramo,Nodo)|R]):-
	imprima(R),nl,
	write(Ramo),write(' e, portanto, temos: '),nl,
	write(Nodo),write('.').

estado_inicial([sala4,sala1,0]).
meta([sala1,sala2,0]).

transforma([S,X,0],[S1,X,0], muda_sala_sozinho):- (porta(S,S1);porta(S1,S)).
transforma([S,S,1],[S1,S1,1], muda_sala_caixa):- (porta(S,S1);porta(S1,S)).
transforma([S,S,0],[S,S,1],pega_caixa).
transforma([S,S,1],[S,S,0],larga_caixa).

porta(sala1,sala4).
porta(sala2,sala4).
porta(sala3,sala4).
