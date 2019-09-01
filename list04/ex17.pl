calc(List, Average) :-
    sum(List, Sum),
    length(List, Count),
    Average is Sum/Count.

sum([], 0).
sum([H|T], N):-
    sum(T, X),
    N is X + H.

insert_head(Elem, List, [Elem|List]).

average([],[],[]).
average([H1 | T1], [H2 | T2], AvgList):-
    average(T1, T2, List),
    calc([H1,H2], Avg),
    insert_head(Avg, List, AvgList).
    

higher_average([], [], 0, 0).
higher_average([HN | TN], [HA | TA], Name, Max) :-
    higher_average(TN, TA, _, TMax),
    HA > TMax,
    Max is HA,
    Name = HN.

higher_average([_ | TN], [HA | TA], Name, Max) :-
    higher_average(TN, TA, TName, TMax),
    HA =< TMax,
    Max is TMax,
    Name = TName.

print_all([], []).
print_all([HN | TN], [HA | TA]) :-
    write(HN),
    write(' com media '),
    write(HA),
    nl,
    print_all(TN, TA).

progr(ListName, ListaP1, ListaP2):-
    average(ListaP1, ListaP2, ListAverage),

    higher_average(ListName, ListAverage, Name, Max),
    write('O aluno que teve maior media foi: '),
    write(Name), write(' com media '), write(Max), nl,

    print_all(ListName,ListAverage).