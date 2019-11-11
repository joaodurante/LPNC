;; 1 - Escreva uma função que recebe um item e uma lista e retorna o sufixo da lista a partir do ponto onde 
;;     ocorre o item pela primeira vez nela, ou NIL caso o item não ocorra na lista.
(defun sufixo (item lista)
    (if (null lista) nil
        (if (= item (first lista)) lista

        )
    )
)

;; 2 - Escreva uma função (comb n m) que retorna o número de combinações de n elementos tomados m a m
(defun comb (n m)
    (/ (fatorial n) (* (fatorial m) (fatorial (- n m))))
)

(defun fatorial (n)
    (if (= n 0) 1
        (* n (fatorial (- n 1)))
    )
)