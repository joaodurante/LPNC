/* Nome: Joao Pedro De Munno Durante */

resolva:-
  estado_inicial(E),
  busca([[ramo(raiz,E)]],Solucao),
  imprima(Solucao).
  busca([Solucao|_],Solucao):- atinge_meta(Solucao),!.
  busca([T|Fila],Solucao):-
  ache_todos(Extensao,estende_ate_filho(T,Extensao),Extensoes),
  concatena(Fila,Extensoes,Fila_ext),
  busca(Fila_ext,Solucao).
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
  write(Ramo),write(' então, temos: '),nl,
  write(Nodo),write('.').
  /* PROBLEMA DO TABULEIRO */
  estado_inicial([1,5]).
  meta([4,5]).
  transforma([1,5],[2,7], 'Cima-Direita').
  transforma([2,7],[4,8], 'Cima-Direita').
  transforma([4,8],[3,6], 'Baixo-Esquerda').
  transforma([3,6],[5,5], 'Cima-Esquerda').
  transforma([5,5],[6,7], 'Cima-Direita').
  transforma([6,7],[8,8], 'Cima-Direita').
  transforma([8,8],[7,6], 'Baixo-Esquerda').
  transforma([7,6],[8,4], 'Cima-Esquerda').
  transforma([8,4],[7,2], 'Baixo-Esquerda').
  transforma([7,2],[5,1], 'Baixo-Esquerda').
  transforma([5,1],[6,3], 'Cima-Direita').
  transforma([6,3],[4,4], 'Baixo-Direita').
  transforma([4,4],[3,2], 'Baixo-Esquerda').
  transforma([3,2],[1,1], 'Baixo-Esquerda').
  transforma([1,1],[2,3], 'Cima-Direita').
  transforma([2,3],[4,2], 'Cima-Esquerda').
  transforma([4,2],[2,1], 'Baixo-Esquerda').
  transforma([2,1],[1,3], 'Baixo-Direita').
  transforma([1,3],[3,4], 'Cima-Direita').
  transforma([3,4],[5,3], 'Cima-Esquerda').
  transforma([5,3],[6,1], 'Cima-Esquerda').
  transforma([6,1],[8,2], 'Cima-Direita').
  transforma([8,2],[7,4], 'Baixo-Direita').
  transforma([7,4],[8,6], 'Cima-Direita').
  transforma([8,6],[7,8], 'Baixo-Direita').
  transforma([7,8],[5,7], 'Baixo-Esquerda').
  transforma([5,7],[6,5], 'Cima-Esquerda').
  transforma([6,5],[4,6], 'Baixo-Direita').
  transforma([4,6],[3,8], 'Baixo-Direita').
  transforma([3,8],[1,7], 'Baixo-Esquerda').
  transforma([1,7],[3,3], 'Cima-Esquerda').
  transforma([3,3],[1,4], 'Baixo-Direita').
  transforma([1,4],[2,2], 'Cima-Esquerda').
  transforma([2,2],[4,1], 'Cima-Esquerda').
  transforma([4,1],[6,2], 'Cima-Direita').
  transforma([6,2],[8,1], 'Cima-Esquerda').
  transforma([8,1],[7,3], 'Baixo-Direita').
  transforma([7,3],[5,4], 'Baixo-Direita').
  transforma([5,4],[6,6], 'Cima-Direita').
  transforma([6,6],[8,5], 'Cima-Esquerda').
  transforma([8,5],[7,7], 'Baixo-Direita').
  transforma([7,7],[5,8], 'Baixo-Direita').
  transforma([5,8],[3,7], 'Baixo-Esquerda').
  transforma([3,7],[1,8], 'Baixo-Direita').
  transforma([1,8],[2,6], 'Cima-Esquerda').
  transforma([2,6],[4,7], 'Cima-Direita').
  transforma([4,7],[2,8], 'Baixo-Direita').
  transforma([2,8],[1,6], 'Baixo-Esquerda').
  transforma([1,6],[3,5], 'Cima-Esquerda').
  transforma([3,5],[5,6], 'Cima-Direita').
  transforma([5,6],[6,8], 'Cima-Direita').
  transforma([6,8],[8,7], 'Cima-Esquerda').
  transforma([8,7],[7,5], 'Cima-Esquerda').
  transforma([7,5],[8,3], 'Cima-Esquerda').
  transforma([8,3],[7,1], 'Cima-Esquerda').
  transforma([7,1],[5,2], 'Baixo-Direita').
  transforma([5,2],[6,4], 'Cima-Direita').
  transforma([6,4],[4,3], 'Baixo-Esquerda').
  transforma([4,3],[3,1], 'Baixo-Esquerda').
  transforma([3,1],[1,2], 'Baixo-Direita').
  transforma([1,2],[2,4], 'Cima-Direita').
  transforma([2,4],[4,5], 'Cima-Direita').

