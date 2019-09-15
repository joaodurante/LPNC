:-dynamic pos/2.

pos(robo,cozinha).
pos(tv,quarto).

pegue(Obj):-
	pos(robo,Lugar1),
	format('Onde esta o ~w?',[Obj]),
	read(Lugar2),
	format('anda de ~w ate ~w~n',[Lugar1,Lugar2]),
	format('pega ~w~n',[Obj]),
	retract(pos(robo,Lugar1)),
	asserta(pos(robo,Lugar2)).

ande(Obj,Lugar):-
	pos(robo,Lugar2), pos(Obj,Lugar2),
	format('anda de ~w ate ~w~n',[Lugar2,Lugar]),
	retract(pos(robo,Lugar2)),
	asserta(pos(robo,Lugar)),
	retract(pos(Obj,Lugar2)),
	asserta(pos(Obj,Lugar)).
ande(Lugar):-
	pos(robo,Lugar2),
	format('anda de ~w ate ~w~n',[Lugar2,Lugar]),
	retract(pos(robo,Lugar2)),
	asserta(pos(robo,Lugar)).

solte(Obj):- format('solta ~w~n',[Obj]).

 
leve(Obj, LugarFinal):-
	pos(robo, Lugar1),
	pos(Obj, Lugar2),
	format('anda de ~w ate ~w~n',[Lugar1,Lugar2]),
	format('pega ~w~n',[Obj]),
	format('anda de ~w ate ~w~n',[Lugar2,LugarFinal]),
	format('solta ~w~n',[Obj]).
