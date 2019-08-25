concat([],L,L).
concat([Head|Tail],L,[Head|L2]):-
    concat(Tail,L,L2). 