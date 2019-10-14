;; LISTA LISP - Aula Pratica 09
;; João Pedro De Munno Durante

;; Retirar todas as ocorrências de um elemento de uma lista: 
(defun ocorrencia (Elemento Lista)
	(if (null Lista)
	    nil
	    (if (= Elemento (car Lista))
		(ocorrencia Elemento (cdr Lista))
		(cons (car Lista) 
		      (ocorrencia Elemento (cdr Lista))))))


;; Retirar elementos repetidos de uma lista. 
(defun repetidos (Lista)
    (if (null Lista) nil
        (cons (car Lista)
            (repetidos (ocorrencia (car Lista)(cdr Lista)))
        )
    )
)

;; Concatenar duas listas quaisquer
(defun concatenar (Lista1 Lista2)
    (if (null Lista1) Lista2
        (cons (first Lista1)
            (concatenar (rest Lista1) Lista2)
        )
    )
)

;; Encontrar o maior elemento de uma lista numérica. 
(defun maior (Lista)
    (if (null Lista) 
	    nil
	    (if (null (cdr Lista))
            (car Lista)
            (if (> (car Lista)(cadr Lista))
                (maior (cons (car Lista) (cddr Lista)))
                (maior (cdr Lista))
            )
        )
    )
)


(defun menor (Lista)
    (if (null Lista)
        nil
        (if (null (cdr Lista))
            (first Lista)
            (if (< (first Lista)(cadr Lista))
                (menor (cons (first Lista) (cddr Lista)))
                (menor (rest Lista))
            )
        )
    )
)

;; Encontrar o menor elemento de uma lista numérica. 
(defun acrescenta (Y X Lista)
	(if (null Lista) nil
	    (if (= X (car Lista))
		(concatenar (list X Y) (rest Lista))
		(cons (first Lista) (acrescenta Y X (rest Lista))))))


;; Pegar a posição de um elemento na lista, dado o elemento e a lista 
(defun posicao (Elemento Lista)
    (if (null Lista) nil
        (if (= Elemento (first Lista)) 1
            (+ 1 (posicao Elemento (rest Lista)))
        )
    )
)

;; Inserir elemento na primeira posição de uma lista
(defun inserir_inicio (Elemento Lista)
    (if (null Lista) Elemento
        (cons Elemento Lista)
    )
)

;; Inserir elemento na última posição de uma lista. 
(defun inserir_final (Elemento Lista)
    (if (null Lista) Elemento
        (reverse (cons Elemento (reverse Lista)))
    )
)

;; Inserir elemento numa posição N da lista.
(defun inserir_posicao_n (Elemento Posicao Lista)
    (if (= Posicao (size Lista))
        (inserir_final Elemento Lista)
        (inserir Elemento Posicao Lista 0)
    )
)

(defun inserir (Elemento Posicao Lista Contador)
    (if (null Lista) nil
        (if (= Posicao Contador)
            (concatenar (list Elemento (car Lista)) (cdr Lista))
            (cons (car Lista) (inserir Elemento Posicao (cdr Lista) (1+ Contador)))
        )
    )
)

;; Substituir um elemento de uma lista por outro elemento
(defun substituir_elemento (Elemento Novo Lista)
    (if (null Lista) nil
        (if (= elemento (first Lista))
            (cons Novo (substituir_elemento Elemento Novo (rest Lista)))
            (cons (first Lista) (substituir_elemento Novo Elemento (rest Lista)))
        )
    )
)

;; Duplicar elementos de uma lista. 
(defun duplicar (Lista)
    (if (null Lista) nil
        (concatenar Lista Lista)
    )
)

(defun size (Lista)
    (if (null Lista) 0
        (+ 1 (size (rest Lista)))
    )
)

;; Contar ocorrências de um elemento na lista 
(defun contar_ocorrencia (Elemento Lista)
    (- (size Lista) (size (ocorrencia Elemento Lista)))
)

;; Acrescenta elemento Y depois do elemento X na lista
(defun  acrescenta_Y (Y X Lista)
    (if (null Lista) nil
        (if (= X (first Lista)) (concatenar (list X Y) (rest Lista))
            (cons (first Lista)(acrescenta_Y Y X (rest Lista)))
        )
    )
)

;; Trocar o valor do n-ésimo elemento de uma lista por outro elemento 
(defun trocar_elemento_nesimo (Novo N Contador Lista)
    (if (null Lista) nil
        (if (= Contador N)
            (concatenar (list Novo) (rest Lista))
            (cons (first Lista)(trocar_elemento_nesimo Novo N (1+ Contador) (rest Lista)))
        )
    )
)

;; Calcular a media de duas listas 
(defun media (Lista1 Lista2)
    (/ (+ (media_lista Lista1) (media_lista Lista2)) 2)
)

(defun soma (Lista)
    (if (null Lista) 0
        (+ (first Lista) (soma (rest Lista)))
    )
)

(defun media_lista (Lista)
    (/ (soma Lista) (size Lista))
)