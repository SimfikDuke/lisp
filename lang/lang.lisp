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
            (and (> ,step 0) (>= local-from ,to)) 
            (and (< ,step 0) (<= local-from ,to))
            ) nil) 
         (t (setq local-from (+ local-from ,step)))))))

(defun range (&key (from 0) (to 0) (step 1) (generator (xrange :from from :to to :step step)))
  ((lambda (next)
     (cond
       ((null next) nil)
       (t (cons next (range :from from :to to :step step :generator generator)))))
   (funcall generator)))

(defmacro x (for x in lst if x sign num)
  `(mapcan (lambda (el) (cond ((,sign el ,num) (list el)) (t nil))) ,lst))


(print (len `(1 2 4 2 3)))

(print (range :from 1 :to 5 :step 1))

(print (x for x in (range :from 1 :to 5 :step 1) if x > 2))