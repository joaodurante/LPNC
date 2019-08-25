replace(_, _, [], []).
replace(X, Y, [X | Tail], [Y | Tail2]) :- 
    replace(X, Y, Tail, Tail2).

replace(X, Y, [Head | Tail], [Head | Tail2]) :- 
    Head \= X,
    replace(X, Y, Tail, Tail2).
