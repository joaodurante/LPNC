professor(jose, matematica).
professor(maria, geografia).
professor(chico, biologia).
professor(joao, ingles).
professor(ana, historia).
professor(jorge, filosofia).

disciplina(matematica, segunda-feira, 07, 12).
disciplina(geografia, terca-feira, 08, 13).
disciplina(filosofia, terca-feira, 13, 18).
disciplina(biologia, quarta-feira, 09, 14).
disciplina(ingles, quinta-feira, 10, 15).
disciplina(historia, sexta-feira, 11, 16).


dados_professor(Prof):-
    professor(Prof, Disc),
    disciplina(Disc, Dia, Inicio, Termino),
    write('Professor: '), write(Prof),nl,
    write('Disciplina: '), write(Disc), nl,
    write('Dia da semana: '), write(Dia), nl,
    write('Inicio: '), write(Inicio), write('. Termino: '), write(Termino).

dia_professor(Dia):-
    disciplina(Disc, Dia, _, _),
    professor(Prof, Disc),
    write('Professor '), write(Prof), nl.

disciplina_professor(Prof):-
    professor(Prof, Disc),
    write(Disc).