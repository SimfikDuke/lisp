(defun merge_lst (lst1 lst2)
  ((lambda (first rest)
      (cond
        ((null lst2) lst1)
        (t (merge_lst (cons first lst1) rest))))
    (car lst2) (cdr lst2)))

(defun make_boolean (lst)
  ((lambda (first rest)
      (cond
        ((null lst) '(nil))
        (t 
          ((lambda (boolean_of_rest)
              (merge_lst
                (mapcar (lambda (x)(cons first x)) boolean_of_rest)
                boolean_of_rest))
            (make_boolean rest)))))
    (car lst)
    (cdr lst)))

(print (make_boolean `(1 2 3 4)))