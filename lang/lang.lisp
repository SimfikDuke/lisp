; PyLisp dialect for Common Lisp


(defun len (arr) 
  (cond
    ((null arr) 0)
    (t (+ 1 (len (cdr arr))))))


(defmacro xrange (&key (from 0) (to 0) (step 1))
  `(let ((local-from (- ,from ,step)))
     (lambda () 
       (cond 
         ((or 
            (and (> ,step 0) (>= (+ local-from ,step) ,to)) 
            (and (< ,step 0) (<= (+ local-from ,step) ,to))
            ) nil) 
         (t (setq local-from (+ local-from ,step)))))))


(defun range (&key (from 0) (to 0) (step 1) (generator (xrange :from from :to to :step step)))
  ((lambda (next)
     (cond
       ((null next) nil)
       (t (cons next (range :generator generator)))))
   (funcall generator)))


(defmacro x (for x in lst if x sign num)
  `(mapcan (lambda (el) (cond ((,sign el ,num) (list el)) (t nil))) ,lst))


(defun sublist (lst &key (from 0) (to 0) (by 1) (index nil))
  ((lambda (lstlen)
    (cond
      ((eq index 0) (car lst))
      ((not (null index)) (sublist (cdr lst) :index (- index 1)))
      ((< from 0) (sublist lst :from (+ lstlen from) :to to :by by))
      ((< to 0) (sublist lst :from from :to (+ lstlen to) :by by))
      ((and (not (null index)) (< index 0)) (sublist lst :index (+ lstlen index)))
      ((or (>= from to) (null lst)) nil)
      (t (cons (sublist lst :index from) (sublist lst :from (+ from by) :to to :by by)))))
   (len lst)))