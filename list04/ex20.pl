estado('sao paulo', 45919049, 248222.362).
estado('minas gerais', 21168791, 586522.122).
estado('rio de janeiro', 17264943, 43780.172).
estado('bahia', 14873064, 564733.177).
estado('parana', 11433957, 199 307.922).
estado('rio grande do sul', 11377239, 281730.223).
estado('pernambuco', 9557071, 98311.616).
estado('ceara', 9132078, 148920.472).
estado('para', 8602865, 1247954.666).
estado('santa catarina', 7164788, 95736.165).
estado('maranhao', 7075181, 331937.450).
estado('goias', 7018354, 340111.783).
estado('amazonas', 4144597, 1559159.148).
estado('espirito santo', 4018650, 46095.583).
estado('paraiba', 4018127, 56585.000).
estado('rio grande do norte', 3506853, 52811.047).
estado('mato grosso', 3484466, 903366.192).
estado('alagoas', 3337357, 27778.506).
estado('piaui', 3273227, 251577.738).
estado('distrito federal', 3015268, 5779.999).
estado('mato grosso do sul', 2778986, 357145.532).
estado('sergipe', 2298696, 21915.116).
estado('rondonia', 1777225, 237590.547).
estado('tocantins', 1572866, 277720.520).
estado('acre', 881935, 164123.040).
estado('amapa', 845731, 142828.521).
estado('roraima', 605761, 224 300.506).

insert_head(Elem, List, [Elem|List]).

make_list(NameList, PopList, AreaList):-
    estado(Name, Pop, Area),
    insert_head(Name, X, NameList),
    insert_head(Pop, Y, PopList),
    insert_head(Area, Z, AreaList).


maior_estado([], [], 0, 0).
maior_estado([HN | TN], [HA | TA], Name, Max) :-
    maior_estado(TN, TA, _, TMax),
    HA > TMax,
    Max is HA,
    Name = HN.

maior_estado([_ | TN], [HA | TA], Name, Max) :-
    maior_estado(TN, TA, TName, TMax),
    HA =< TMax,
    Max is TMax,
    Name = TName.
    


progr:-
    make_list(NameList, PopList, AreaList),
    maior_estado(NameList, AreaList, Name, Max),
    write(NameList), write(AreaList), write(PopList),
    write(Name).
