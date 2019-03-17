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
        (get city1 `x)
        (get city1 `y)
        (get city2 `x)
        (get city2 `y)
    )
)

(setf (get `Simferopol `x) 150)
(setf (get `Simferopol `y) 135)
(setf (get `Sevastopol `x) 200)
(setf (get `Sevastopol `y) 50)

(print (distantion `Simferopol `Sevastopol))
;98.61542