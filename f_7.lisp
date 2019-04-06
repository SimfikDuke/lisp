;7. Определите фильтр (УДАЛИТЬ-ЕСЛИ-НЕ пред список),удаляющий из списка список все элементы, которые не обладают свойством, наличие которого проверяет предикат пред.

(defun del-if-not (pred lst)
	(
		(lambda (first rest)
			(cond
				((null lst) nil)
				(t
      				(
						(lambda (result-of-rest)
							(cond
	       						((apply pred (list first))
	              					(cons first result-of-rest))
	       						(t result-of-rest)
	            			)
						)
	     				(del-if-not pred rest)
          			)
				)
			)
		)
		(car lst)
		(cdr lst)
	)
)

(defun check-x-prop-p (sym)
	(cond
		((null (get sym `x)) nil)
		(t t)
	)
)

(setf (get `A `x) 10)
(setf (get `B `x) 20)
(setf (get `C `x) 30)

(print (del-if-not `check-x-prop-p `(A B D C F)))
;(A B C)