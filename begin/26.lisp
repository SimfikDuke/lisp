(defun pairs (lst)
                (cond 
                    ((null (car lst)) lst)
                    (t 
                        (cons (list (car lst) (cadr lst)) (pairs (cddr lst)))
                    )
                )
)