(defun putprop (symbol_name prop_name value) (setf (get symbol_name prop_name) value))
(defun getprop (symbol_name prop_name) (get symbol_name prop_name))

(defun distantion (city1 city2)
    (
        (lambda (city1x city1y city2x city2y) 
            (sqrt
                (+
                    (expt (- city1x city2x) 2)
                    (expt (- city1y city2y) 2)
                )
            )
        )
        (getprop city1 `x)
        (getprop city1 `y)
        (getprop city2 `x)
        (getprop city2 `y)
    )
)

(putprop `Simferopol `x 150)
(putprop `Simferopol `y 135)
(putprop `Sevastopol `x 200)
(putprop `Sevastopol `y 50)

(print (distantion `Simferopol `Sevastopol))
;98.61542