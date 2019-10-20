;; Lista 10 LISP - 2019
;; João Pedro De Munno Durante

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

;; 05 - Calcule as raízes de uma equação de 2o grau completa: ax2 + bx + c, onde o usuário precisa passar os valores de a, b e c (com a, b e c diferentes de zero). Use a fórmula de Bhaskara. Só considere raízes reais (não complexas)
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

;; 06 -Altere o exercício sobre raízes da equação quadrática completa, considerando a possibilidade do usuário especificar a ordem que vai entrar com os valores para a, b e c. (use &key)
(defun baskhara_key (&key a b c)
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

;; 07 - Altere o exercício sobre raízes da equação quadrática, considerando que os valores de a, b e c são opcionais. Se eles não forem dados pelo usuário, assuma-os com valores iguais a zero (use &optional). 
(defun baskhara_opt (&optional (a 0) (b 0) (c 0))
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

;; 08 - Altere o exercício sobre raízes da equação quadrática, considerando que o usuário pode entrar com a; a e b; a e b e c (use & rest). 
(defun baskhara_rest (a &rest resto)
    (if (null resto) 0
        (if (null (rest resto))
            (/ (sqrt (first resto)) a)
            (
                let ((var (- (raised (first resto))(* 4 a (first (rest resto))))))
                (unless (minusp var)(
                    let((root(sqrt var)))
                    (format t "x1 = ~$ ~%" (/(-(- (first resto))root)(* 2 a))) 
                    (format t "x2 = ~$ ~%" (/(+(- (first resto))root)(* 2 a)))
                ))
            )
        )
    )
)

;; 09 - Faca uma função que mostre um menu de operações sobre lista e retorne o item do menu escolhido
(defun menu()
    (progn
        (print "0. Inserir")
        (print "1. Buscar")
        (print "2. Remover")
        (print "3. Contar")
        (print "4. Maior")
        (print "5. Menor")
        (write-line "")

        (setq ans (read))
        (cond
            ((= ans 0) (print "Escolhido: Inserir"))
            ((= ans 1) (print "Escolhido: Buscar"))
            ((= ans 2) (print "Escolhido: Remover"))
            ((= ans 3) (print "Escolhido: Contar"))
            ((= ans 4) (print "Escolhido: Maior"))
            ((= ans 5) (print "Escolhido: Menor"))
        )
    )
)

;; 10 - Faça uma função que usuário pode escolher se quer ver o menu ou já, de antemão, escolher a operação a ser executada sobre a lista. Se o primeiro argumento contiver o valor 0 (zero), mostra o menu e faz aleitura da operação a ser feita. Caso contrário, executa a operação necessária. Após o primeiroargumento, pode-se ter um número quaisquer de valores que comporão a entrada das operações do menu.
(defun menu2 (&rest ans)
    (if (null (first ans)) (menu)
        (cond
            ((= (first ans) 0) (print "Escolhido: Inserir"))
            ((= (first ans) 1) (print "Escolhido: Buscar"))
            ((= (first ans) 2) (print "Escolhido: Remover"))
            ((= (first ans) 3) (print "Escolhido: Contar"))
            ((= (first ans) 4) (print "Escolhido: Maior"))
            ((= (first ans) 5) (print "Escolhido: Menor"))
        )
    )
)

(defun raised (x)
    (* x x)
)


(defun size (Lista)
    (if (null Lista) 0
        (+ 1 (size (rest Lista)))
    )
)