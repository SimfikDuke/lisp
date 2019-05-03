; 4. Определите в виде макроса форму (FIF тест отр нуль полож).

(defmacro FIF (test negative zero positive)
  `(cond
     ((< ,test 0) ,negative)
     ((= ,test 0) ,zero)
     (t ,positive)))

(print (FIF -1 `- `= `+))
(print (FIF 0 `- `= `+))
(print (FIF 1 `- `= `+))
; - 
; = 
; + 