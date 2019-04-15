(defun gen-fib ()
	(let ((p1 0) (p2 1))
		(lambda ()
			(setq
				temp p1
				p1 (+ p2 p1)
				p2 temp))
	)
)

(setq gen (gen-fib))

(print (funcall gen))
(print (funcall gen))
(print (funcall gen))
(print (funcall gen))
(print (funcall gen))
(print (funcall gen))
(print (funcall gen))
(print (funcall gen))
; 0 
; 1 
; 1 
; 2 
; 3 
; 5 
; 8 
; 13 