; 2. Определите макрос (POP стек), который читает из стека верхний элемент и меняет значение переменной стека.

(defmacro pop-stack (s)
  `(prog1
     (setq top (car ,s))
     (setq ,s (cdr ,s))))

(setq num-stack `(1 2 3))
(setq sym-stack `(hello world))

(print (pop-stack num-stack))
(print (pop-stack num-stack))
(print (pop-stack sym-stack))
(print (pop-stack num-stack))
(print (pop-stack sym-stack))
; 1 
; 2 
; HELLO 
; 3 
; WORLD