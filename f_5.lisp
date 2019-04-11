;5. Определитефункциональныйпредикат(НЕКОТОРЫй пред список),который истинен, когда, являющейся функциональным аргументом предикат пред истинен хотя бы для одного элемента списка список.

(defun eq-to-two-p (val) (cond ((eq val 2) (list t)) (t nil)))

(defun any-of-p (funcp args)
		(not (null (mapcan funcp args)))
) 

(print (any-of-p `eq-to-two-p `(1 3 4 5)))
(print (any-of-p `eq-to-two-p `(1 3 4 5 2 3)))
; NIL
; T
