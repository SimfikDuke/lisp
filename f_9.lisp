(defun gen nil
  ((lambda (last-number penultimate-number)
     (cond
       ((null (get `gen `prev))
        (car (setf (get `gen `prev) (list 0 1))))
       (t (car (setf (get `gen `prev)
                     (list (+ last-number penultimate-number)
                           last-number))))))
   (car (get `gen `prev))
   (cadr (get `gen `prev))))

(print (gen))
(print (gen))
(print (gen))
(print (gen))
(print (gen))
(print (gen))
(print (gen))
(print (gen))
; 0 
; 1 
; 1 
; 2 
; 3 
; 5 
; 8 
; 13 