;5. Определитефункциональныйпредикат(НЕКОТОРЫй пред список),который истинен, когда, являющейся функциональным аргументом предикат пред истинен хотя бы для одного элемента списка список.

(defun eq-to-two-p (val) (cond ((eq val 2)) (t nil)))

(defun any-of-p (funcp args)
	(
		(lambda (first-arg rest-args)
			(
				cond
				((null args) nil)
    			((apply funcp (list first-arg)) t)
				(t
					(any-of-p funcp rest-args)
				)
			)
		)
		(car args)
		(cdr args)
	)
)

(print (any-of-p `eq-to-two-p `(1 3 4 5)))
(print (any-of-p `eq-to-two-p `(1 3 4 5 2 3)))
; NIL
; T