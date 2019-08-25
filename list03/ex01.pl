deleteMember(_, [], []).
deleteMember(X, [X | Xx], Y) :-
    deleteMember(X, Xx, Y), !.
deleteMember(X, [Z | Xx], [Z | Y]) :-
    deleteMember(X, Xx, Y).