(defun srt (lst)
                (cond 
                    ((null (car lst)) lst)
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
(print (srt `(1 nil)))
(print (srt `(1 2 3)))
(print (srt `(nil)))
(print (srt `(hello world this is code test)))