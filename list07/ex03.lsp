(defun dobro (x)
    (* x 2)
)

(defun triplo (x)
    (* x 3)
)

(defun elevado (x y)
    (let ((result 1))
    (dotimes (count y result)
        (setf result (* x result))))
)

(defun multiplica (x y)
    (* x y)
)

(defun soma (x y)
    (+ x y)
)

(defun subtrai (x y)
    (- x y)
)

(defun divide (x y)
    (/ x y)
)

(defun menor2 (x y)
    (or x y)
)

(defun menor3 (x y z)
    (cond 
        ((and (< x y) (< x z))
            x)
        ((and (< y x) (< y z))
            y)
        (t z)
    )
)

(defun maior2 (x y)
    (and x y)
)

(defun maior3 (x y z)
    (cond 
        ((and (> x y) (> x z))
            x)
        ((and (> y x) (> y z))
            y)
        (t z)
    )
)

(defun impar (x)
    (let (( y (/ x 2)))
        (not(zerop(- y (truncate(/ x 2)))))
    )
)