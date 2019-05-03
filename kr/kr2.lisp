(defun get-posl (n) 
  (cond
    ((= n 0) nil)
    (t (cons n (get-posl (- n 1))))))

(defun razb (n)
  (mapcan (lambda (x) 
            (cond 
              ((= (mod n x) 0) (list x))
              (t nil))) 
          (get-posl (/ n 2))))

(print (razb 60))

; (defun razb (n &optional (c 1))
;   (cond
;     ((= n 1) nil)
;     ((> c (/ n 2)) nil)
;     ((= (mod n c) 0) (cons c (razb n (+ c 1))))
;     (t (razb n (+ c 1)))))


(defun sovp (n)
  (= n (apply `+ (razb n))))

(defun nextsov (prev)
  ((lambda (inc)
     (cond
       ((sovp inc) inc)
       (t (nextsov inc)))
     )
   (+ prev 1)))

(defun gen-sov ()
	(let ((prev 5))
		(lambda ()
			(setq prev (nextsov prev)))
	)
)

; (setq gen (gen-sov))

; (print (funcall gen))
; (print (funcall gen))
; (print (funcall gen))