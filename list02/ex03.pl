primeiro_prato(salada_palmito, 2.0).
primeiro_prato(sopa_ervilha, 1.0).
primeiro_prato(salada_tomate, 2.0).
primeiro_prato(sopa_abobora, 3.0).

prato_principal(peixe, 4.6).
prato_principal(frango, 2.0).
prato_principal(picanha, 10.0).
prato_principal(costela, 6.0).

sobremesa(salada_frutas, 2.0).
sobremesa(gelatina, 1.0).
sobremesa(mousse, 3.0).
sobremesa(pudim, 4.0).

cardapio(PrimPrato, PratoPrinc, Sobr, Min, Max, Custo):-
    primeiro_prato(PrimPrato, Valor1),
    prato_principal(PratoPrinc, Valor2),
    sobremesa(Sobr, Valor3),
    Custo is Valor1 + Valor2 + Valor3,
    Custo >= Min,
    Custo =< Max.