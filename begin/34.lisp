(defun delel (lst el)
    (
        (lambda (first rest)
            (cond
                ((null lst) NIL)
                ((= first el) rest)
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

(defun equal_lists_p (lst1 lst2)
    (and
        (null (diff lst1 lst2))
        (null (diff lst2 lst1))
    )
)

(print (equal_lists_p `(1 2 3 4) `(1 4)))
(print (equal_lists_p `(1 2 3 4) `(1 2 3 4)))
(print (equal_lists_p `(1 2 3 4) `(2 1 4 3)))