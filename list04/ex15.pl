barril(1,100,10).
barril(1,50,25).
barril(1,25,20).
barril(1,10,15).
barril(2,100,12).
barril(2,50,27).
barril(3,25,23).
barril(3,10,18).

delete_item(_,[],[]).
delete_item(X,[X|T],R):- delete_item(X,T,R), !.
delete_item(X,[H|T],[H|R]) :- delete_item(X,T,R).

delete_duplicates([],[]).
delete_duplicates([H|T], [H|R]) :- 
    member(H,T),!,
    delete_item(H,T,R1),
    delete_duplicates(R1,R).

delete_duplicates([H|T],[H|R]):-
    delete_duplicates(T,R).

imprime_lista(Tipos):-
    findall(X, barril(X,_,_), ListTipos),
    delete_duplicates(ListTipos, Tipos).

sum([], 0).
sum([H|T], N):-
    sum(T, X),
    N is X + H.

get_qtt(Qtt):-
    findall(X, barril(_,_,X), QttList),
    sum(QttList, Qtt).
    


cervejaria :-
    write('A cervejaria possui os seguintes TIPOS: '),
    imprime_lista(Tipos),
    write(Tipos),
    nl,
    write('Informe o VOLUME do barril: '),
    read(Volume),
    aggregate_all(count, barril(Count, Volume, _), Count),
    write('Com esse volume de '),
    write(Volume),
    write(' temos: '),
    write(Count),
    write(' barris '),
    nl,
    write('A quantidade TOTAL de barris armazenados: '),
    get_qtt(Qtt),
    write(Qtt),write(' barris '),nl,
    listing(barril).