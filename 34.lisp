(defun delel (lst el)(
    cond
    ((null (car lst)) (LIST NIL NIL))
    ((= (car lst) el) (LIST (cdr lst) T))
    (t 
        (setq op (delel (cdr lst) el))
        (LIST (cons (car lst) (car op)) (cadr op))
        )
))

(defun eq (lst1 lst2)(
    cond
    ((and (null lst1) (null lst2)) T)
    ((or (null lst1) (null lst2)) NIL)
    (T
        (setq deleted (delel lst2 (car lst1)))
        (
            cond
            ((null (cadr deleted)) NIL)
            (T (eq (cdr lst1) (car deleted)))
        )
    )
))