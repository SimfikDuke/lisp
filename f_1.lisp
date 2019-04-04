;1. Определите FUNCALL через функционал APPLY

(defun fun-call (f &rest args)
	(apply f args)
)
	      
(defun my-func (&rest args) (print args))
              
(fun-call `my-func 1 2 3)
;(1 2 3)