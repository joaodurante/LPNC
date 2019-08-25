insert_end(X, [], [X]).
insert_end(X, [Head | Tail], [Head | List]):-
    insert_end(X, Tail, List).