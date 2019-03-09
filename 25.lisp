(defun deleven (lst)
                (cond 
                    ((null (car lst)) lst)
                    (t 
                        (cons (car lst) (deleven (cddr lst)))
                    )
                )
)