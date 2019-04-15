; Определите функцию, которая возвращает в качестве значения свое определение (лямбда-выражение).

(defun selfie ()
	`(self will be returned))

(defun self ()
	(function-lambda-expression `self))

(print (selfie))
;(SELF WILL BE RETURNED)
(print (self))
;(LAMBDA NIL (DECLARE (SYSTEM::IN-DEFUN SELF))
; (BLOCK SELF (FUNCTION-LAMBDA-EXPRESSION `SELF)))
