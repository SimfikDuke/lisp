;7. Определите фильтр (УДАЛИТЬ-ЕСЛИ-НЕ пред список),удаляющий из списка список все элементы, которые не обладают свойством, наличие которого проверяет предикат пред.

(defun del-if-not (pred lst)
	(mapcan pred lst)
)

(defun check-x-prop-p (sym)
	(cond
		((null (get sym `x)) nil)
		(t (list sym))
	)
)

(setf (get `A `x) 10)
(setf (get `B `x) 20)
(setf (get `C `x) 30)

(print (del-if-not `check-x-prop-p `(A B D C F)))
;(A B C)