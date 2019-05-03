(defun many-fun (funcs x)
  (mapcar (lambda (f) (apply f (list x))) funcs))


(defun mlt (x) (* x 5))
(defun pls (x) (+ x 5))
(defun dvd (x) (/ x 5))

(print (many-fun `(mlt pls dvd) 10))
(print (many-fun `(dvd mlt pls) 45))
; (50 15 2) 
; (9 225 50)
