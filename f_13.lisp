; Определите функцию, которая возвращает в качестве значения свое определение (лямбда-выражение).

(defun self ()
	(caddr (cadddr (function-lambda-expression `self))))

(print (self))

; (CADDR (CADDDR (FUNCTION-LAMBDA-EXPRESSION `SELF)))