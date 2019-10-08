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
        (cons (car Lista1)
            (concatenar (cdr Lista1) Lista2)
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
            (car Lista)
            (if (< (car Lista)(cadr Lista))
                (menor (cons (car Lista) (cddr Lista)))
                (menor (cdr Lista))
            )
        )
    )
)


(defun acrescenta (Y X Lista)
	(if (null Lista) nil
	    (if (= X (car Lista))
		(concatenar (list X Y) (cdr Lista))
		(cons (car Lista) (acrescenta Y X (cdr Lista))))))


(defun posicao (Elemento Lista)
    (if (null Lista) nil
        (if (= Elemento (car Lista)) 1
            (+ 1 (posicao Elemento (cdr Lista)))
        )
    )
)

(defun inserir_inicio (Elemento Lista)
    (if (null Lista) Elemento
        (cons Elemento
            (inserir_inicio (car Lista)(cdr Lista))
        )
    )
)

(defun inserir_final (Elemento Lista)
    (if (null Lista) Elemento
        (cons (car Lista)(inserir_final Elemento (cdr Lista)))
    )
)