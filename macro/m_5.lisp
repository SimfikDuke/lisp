; 5. Определите в виде макроса форму (REPEAT e UNTIL p) паскалевского типа.

(defmacro repeat (e until p)
  `(cond 
     (,p (progn ,e (repeat ,e until ,p)))))

(setq stack `(1 2 3))
(repeat (print (pop stack)) until stack)
; 1
; 2
; 3