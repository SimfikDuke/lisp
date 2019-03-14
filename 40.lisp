(defun delel (lst el)
    (
        (lambda (first rest)
            (cond
                ((null lst) NIL)
                ((equalp first el) rest)
                (t (cons first (delel rest el)))
            )   
        )
        (car lst) (cdr lst)
    )
)
 
(defun diff (source elements)
    (
        (lambda (first_element rest_elements)
            (cond
                ((null elements) source)
                (t (diff (delel source first_element) rest_elements))
            )
        )
        (car elements) (cdr elements)
    )
)

(print (diff `(1 2 3 4) `(1 4)))
(print (diff `(1 2 3 4) `(1 2 3 4)))
(print (diff `(1 2 3 4) `(6 7 8)))
(print (diff `(There is no elements in list) `(no)))