greater([R],R).
greater([C|L],R) :- 
    greater(L,A),
    (A > C -> R = A; R = C).