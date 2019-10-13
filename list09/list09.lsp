;; 01 - Função que dado um argumento, faça a identificação se ele é um atomo, caracter, string, numero (complexo, real, racional, float, int) ou lista
(defun verifica_tipo(x)
    (cond
          ((atom x) 
            (print "Atomo") 
            (cond
                ((characterp x) (print "Charactere"))
                ((stringp x) (print "String"))
                ((numberp x) 
                    (print "Number")
                    (cond
                        ((realp x) (print "Real"))
                        ((complexp x) (print "Complexo"))
                        ((rationalp x) (print "Racional"))
                        ((floatp x) (print "Float"))
                        ((integerp x) (print "Inteiro"))
                    )
                )
            ))
          ((listp x) (print "Lista"))
    )
)

;; 02 - Escrever uma função que elimine os números negativos de uma lista (veja predicado minusp/plusp)
(defun remove_negativo(Lista)
    (if (null Lista) nil
        (if (minusp (first Lista))
            (remove_negativo (rest Lista))
            (cons (first Lista) (remove_negativo (rest Lista)))
        )
    )
)

;; 03 - Escrever uma função que elimine os números pares de uma lista de números (veja predicado evenp/oddp)
(defun remove_par(Lista)
    (if (null Lista) nil
        (if (evenp (first Lista))
            (remove_par (rest Lista))
            (cons (first Lista) (remove_par (rest Lista)))
        )
    )
)

;; 04 - Escrever uma função que conte quantos átomos existem numa lista. Se a lista contiver uma sub-lista, conte os elementos dentro dela
(defun count_atom (list)
    (if (null list) 0
        (if (atom (first list))
            (+ 1 (count_atom (rest list)))
            (+ (count_atom (first list)) (count_atom (rest list)))
        )
    )
)

;; 05 - 
(defun baskhara (&key a b c)
    (if(zerop a) (/ (- c) b)
    (
        let ((var (- (raised b)(* 4 a c))))
        (unless (minusp var)(
            let((root(sqrt var)))
            (format t "x1 = ~$ ~%" (/(-(- b)root)(* 2 a))) 
            (format t "x2 = ~$ ~%" (/(+(- b)root)(* 2 a)))
        ))
    ))
)

;; 06 -
(defun baskhara (a b c)
    (if(zerop a) (/ (- c) b)
    (
        let ((var (- (raised b)(* 4 a c))))
        (unless (minusp var)(
            let((root(sqrt var)))
            (format t "x1 = ~$ ~%" (/(-(- b)root)(* 2 a))) 
            (format t "x2 = ~$ ~%" (/(+(- b)root)(* 2 a)))
        ))
    ))
)

;; 07 - 
(defun baskhara (&optional (a 0) (b 0) (c 0))
    (if(zerop a) (/ (- c) b)
    (
        let ((var (- (raised b)(* 4 a c))))
        (unless (minusp var)(
            let((root(sqrt var)))
            (format t "x1 = ~$ ~%" (/(-(- b)root)(* 2 a))) 
            (format t "x2 = ~$ ~%" (/(+(- b)root)(* 2 a)))
        ))
    ))
)


;; 09 - Faca uma função que mostre um menu de operações sobre lista e retorne o item do menu escolhido
(defun menu()
    (progn
        (print "1. Item-1")
        (print "2. Item-2")
        (print "3. Item-3")
        (read)
    )
)

(defun raised (x)
    (* x x)
)