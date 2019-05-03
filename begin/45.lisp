(defun putprop (symbol_name prop_name value) (setf (get symbol_name prop_name) value))
(defun getX (symbol_name) (get symbol_name `x))
(defun getY (symbol_name) (get symbol_name `y))
(defun set_city (&key city_name x y)
	(putprop city_name `x x)
	(putprop city_name `y y)
)
 
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
        (getX city1)
        (getY city1)
        (getX city2)
        (getY city2)
    )
)

(set_city :city_name `Simferopol :x 150 :y 135)
(set_city :city_name `Sevastopol :x 200 :y 50)
 
(print (distantion `Simferopol `Sevastopol))
;98.61542
