(defun mymin (lst &optional (prevmin (car lst)))
  ((lambda (first rest)
    (cond 
    ((null lst) prevmin)
    (t (mymin rest (min prevmin first)))))
  (car lst) (cdr lst)))

(defun mymax (lst &optional (prevmax (car lst)))
  ((lambda (first rest)
    (cond 
    ((null lst) prevmax)
    (t (mymax rest (max prevmax first)))))
  (car lst) (cdr lst)))

(defun matrixminmax (matrix)
  (mymin (mapcar `mymax matrix)))

(print (matrixminmax `((1 2 5) (3 4 5) (1 2 3))))
; 3