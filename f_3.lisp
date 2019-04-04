;3. Определите функционал (APL-APPLY f x), который применяет каждую функцию fi списка (f1 f2 ... fn) к соответствующему элементу списка x = (x1 x2 ... xn) и возвращает список, сформированный из результатов.
(defun apl-apply (f_list x_args)
	(
		(lambda (first_f rest_f first_x rest_x)
				(cond
					((null first_f) nil)
					(t 
						(append 
							(list (apply first_f (list first_x)))
							(apl-apply rest_f rest_x)
						)
					)
				)
		)
		(car f_list)
		(cdr f_list)
		(car x_args)
		(cdr x_args)
	)
)

(defun f1 (x) (+ x 1))
(defun f2 (x) (+ x 2))
(defun f3 (x) (+ x 3))

(print (apl-apply `(f1 f2 f3) `(10 20 30)))
;(11 22 33) 