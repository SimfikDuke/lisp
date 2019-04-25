(defun gen-fib ()
	(let ((p1 0) (p2 1))
		(lambda ()
			(setq
				temp p1
				p1 (+ p2 p1)
				p2 temp))
	)
)

(setq gen1 (gen-fib))
(setq gen2 (gen-fib))

(print (funcall gen1))
(print (funcall gen1))
(print (funcall gen2))
(print (funcall gen1))
(print (funcall gen2))
(print (funcall gen2))
(print (funcall gen1))
(print (funcall gen2))
(print (funcall gen2))
; 0 
; 1 
; 0 
; 1 
; 1 
; 1 
; 2 
; 2 
; 3 