(defun maxtree (lst)(
        cond
            ((atom lst) 0)
            (t
                (
                    max (+ 1 (maxtree (car lst))) (maxtree (cdr lst))
                )
            )
    )
)