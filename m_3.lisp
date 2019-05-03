; 3. Определите лисповскую форму (IF условие p q) в виде макроса.

(defmacro new-if (condition p q)
  `(if ,condition ,p ,q))

(print (new-if (< 5 2) 'FIVE 'TWO))
(print (new-if (< 2 5) 'FIVE 'TWO))
; TWO
; FIVE