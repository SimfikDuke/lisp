(print "Hello world")
(defun srt (lst)
                (cond 
                    ((null (car lst)) `())
                    (t 
                        (setq nlst (srt (cddr lst)))
                        (list
                            (cons (car lst) (car nlst))
                            (cons (cadr lst) (cadr nlst))
                        )
                    )
                )
)

(print (srt `(1 2 3 4 5 6)))