add(X,[],[X]).
    add(X,[Y|Tail],[Y|Tail1]):-
    add(X,Tail,Tail1).

get_elem(_, _, []).
get_elem([Head|Tail], List, ResultList) :-
    nth0(Head, List, Elem),
    add(Elem, ResultList, New),
    get_elem(Tail, List, ResultList).