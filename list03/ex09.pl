insertAt(Elem,0,List,[Elem|List]).
insertAt(Elem,N,[E|List],[E|List2]):- 
    N2 is N-1,
    insertAt(Elem,N2,List,List2).