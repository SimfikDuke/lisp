(defun onion (n)
                (defun supportf (counter n) (
                        cond 
                            ((= counter n) (list n))
                            (t (list (supportf (+ counter 1) n)))
                
                    )
                )
                (
                    supportf 1 n
                )
            	
)
(onion 2)