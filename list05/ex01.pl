# employee(#id: int, first_name: string, last_name: string, phone: int, address: string)
# project(#id: int, name: string, initial_date: date, end_date: date, #manager: int)
# member(#employee_id: int, #project_id: int)

employee(1, joao, durante, 1111111111, 'rua x').
employee(2, matheus, santos, 2222222222, 'rua y').
employee(3, jorge, pereira, 3333333333, 'rua z').
employee(4, maria, silva, 4444444444, 'rua w').

project(1, estrada, 01/04/2019, 06/09/2019, 1).
project(2, predio, 01/05/2019, 06/010/2019, 1).
project(3, casa, 01/05/2019, 06/11/2019, 3).
project(4, parque, 01/05/2019, 06/12/2019, 3).

member(1, 1).
member(1, 2).
member(2, 3).
member(3, 3).
member(3, 4).
member(4, 2).


# insert(employee, [1, 'joao', 'durante', 988504771, rua]) -> INSERE employee
insert(Table, Args, Term) :-
    Term =.. [Table|Args],
    assertz(Term).


# from( employee , Table , Query ) -> RETORNA TODOS employee
from( Functor , Table , Query ) :- 
    tabela( Table ),
    functor( Table , Functor , ArgC ),
    functor( Query , Functor , ArgC ).

ctr_set( Counter,Value ) :- recorded( Counter , _ , Ref ) , replace( Ref , Value ) .
ctr_set( Counter , Value ) :- recorda( Counter , Value , _ ) .
ctr_is( Counter , Value ) :- recorded( Counter , Value , _ ) .
ctr_inc( Counter , Value ) :- recorded( Counter , Value , Ref ) , C1 is Counter + 1 , replace( Ref , C1 ) .
ctr_dec( Counter , Value ) :- recorded( Counter , Value , Ref ) , C1 is Counter - 1 , replace( Ref , C1 ) .

test( X , Op , Val ) :- 
    Goal =.. [Op,X,Val],
    call( Goal ).



nth_arg( Arg , Table , N ) :-
    Table =.. Z,
    ctr_set( 0 , 0 ),
    nth_member( Arg , Z ),
    ctr_is( 0 , N ).

nth_member( X , [X| _ ] ).
nth_member( X , [ _ |Y] ) :-
    ctr_inc( 0 , _ ),
    nth_member( X, Y ).

do( ( Arg , Op , Val ) , Query ) :- 
    call( Query ),
    arg( Arg , Query , X ),
    test( X , Op , Val ),
    Query =.. [ _ |L],
    output( L ) , fail.
do( _ , _ ).

where( Functor , ( Arg , Op , Val ) , Query ) :- 
    from( Functor , Table , Query ),
    nth_arg( Arg , Table , Argnum ),
    do( ( Argnum , Op , Val ) , Query ).