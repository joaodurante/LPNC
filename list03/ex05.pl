lesser([X],X).
lesser([X|Y],M):-
    lesser(Y,N),
    (X<N -> M=X; M=N).