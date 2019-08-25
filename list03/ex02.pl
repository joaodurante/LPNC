/* In the second predicate we verify if the head (H) element has another occurrences in the tail (T) if so 
   we call the first predicate to delete all the elements equal to the head. */

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