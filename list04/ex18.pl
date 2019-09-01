calc(List, Weight, Avg) :-
    sum(List, Sum),
    length(List, Count),
    Arit is Sum / Count,
    Avg is Arit * Weight.

sum([], 0).
sum([H|T], N):-
    sum(T, X),
    N is X + H.

insert_head(Elem, List, [Elem|List]).

average([],[],_,[]).
average([H1 | T1], [H2 | T2], Weight, AvgList):-
    average(T1, T2, Weight, List),
    calc([H1,H2], Weight, Avg),
    insert_head(Avg, List, AvgList).

lower_average([], [], 10, 10).
lower_average([HN | TN], [HA | TA], Name, Min) :-
    lower_average(TN, TA, _, TMin),
    HA < TMin,
    Min is HA,
    Name = HN.

lower_average([_ | TN], [HA | TA], Name, Min) :-
    lower_average(TN, TA, TName, TMin),
    HA >= TMin,
    Min is TMin,
    Name = TName.

print_all([], []).
print_all([HN | TN], [HA | TA]) :-
    write(HN),
    write(' com media '),
    write(HA),
    nl,
    print_all(TN, TA).

progr(ListName, ListP1, ListP2, Weight):- 
    average(ListP1, ListP2, Weight, ListAverage),

    lower_average(ListName, ListAverage, Name, Min),
    write('O aluno que teve menor media foi: '),
    write(Name), write(' com media: '), write(Min), nl,

    print_all(ListName, ListAverage). 