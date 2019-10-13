(defun ocorrencia (Elemento Lista)
	(if (null Lista)
	    nil
	    (if (= Elemento (car Lista))
		(ocorrencia Elemento (cdr Lista))
		(cons (car Lista) 
		      (ocorrencia Elemento (cdr Lista))))))


(defun repetidos (Lista)
    (if (null Lista) nil
        (cons (car Lista)
            (repetidos (ocorrencia (car Lista)(cdr Lista)))
        )
    )
)


(defun concatenar (Lista1 Lista2)
    (if (null Lista1) Lista2
        (cons (first Lista1)
            (concatenar (rest Lista1) Lista2)
        )
    )
)


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


(defun acrescenta (Y X Lista)
	(if (null Lista) nil
	    (if (= X (car Lista))
		(concatenar (list X Y) (rest Lista))
		(cons (first Lista) (acrescenta Y X (rest Lista))))))


(defun posicao (Elemento Lista)
    (if (null Lista) nil
        (if (= Elemento (first Lista)) 1
            (+ 1 (posicao Elemento (rest Lista)))
        )
    )
)

(defun inserir_inicio (Elemento Lista)
    (if (null Lista) Elemento
        (cons Elemento Lista)
    )
)

(defun inserir_final (Elemento Lista)
    (if (null Lista) Elemento
        (cons (car Lista)(inserir_final Elemento (cdr Lista)))
    )
)

(defun substituir_elemento (Elemento Novo Lista)
    (if (null Lista) nil
        (if (= elemento (first Lista))
            (cons Novo (substituir_elemento Elemento Novo (rest Lista)))
            (cons (first Lista) (substituir_elemento Novo Elemento (rest Lista)))
        )
    )
)

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

(defun contar_ocorrencia (Elemento Lista)
    (- (size Lista) (size (ocorrencia Elemento Lista)))
)

(defun  acrescenta_Y (Y X Lista)
    (if (null Lista) nil
        (if (= X (first Lista)) (concatenar (list X Y) (rest Lista))
            (cons (first Lista)(acrescenta_Y Y X (rest Lista)))
        )
    )
)

(defun trocar_elemento_nesimo (Novo N Contador Lista)
    (if (null Lista) nil
        (if (= Contador N)
            (concatenar (list Novo) (rest Lista))
            (cons (first Lista)(trocar_elemento_nesimo Novo N (1+ Contador) (rest Lista)))
        )
    )
)

(defun media (Lista1 Lista2)
    
)

(defun soma (Lista)
    (if (null Lista) 0
        (cons )
    )
)