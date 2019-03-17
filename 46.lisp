(defun putprop (symbol_name prop_name value) (setf (get symbol_name prop_name) value))
(defun getprop (symbol_name prop_name) (get symbol_name prop_name))

(defun delel (lst el)
    (
        (lambda (first rest)
            (cond
                ((null lst) NIL)
                ((equalp first el) rest)
                (t (cons first (delel rest el)))
            )   
        )
        (car lst) (cdr lst)
    )
)
 
(defun diff (source elements)
    (
        (lambda (first_element rest_elements)
            (cond
                ((null elements) source)
                (t (diff (delel source first_element) rest_elements))
            )
        )
        (car elements) (cdr elements)
    )
)
 
(defun intersectp (lst1 lst2)
    (equalp
        (diff lst1 lst2) lst1
    )
)

(defun parents (name)
    (
        list
        (getprop name `parent1)
        (getprop name `parent2)
    )
)

(defun sisterbrotherp (first_person second_person)
    (
        (lambda (first_person_parents second_person_parents)
            (cond
                ((null (intersectp first_person_parents second_person_parents)) T)
                (T NIL)
            )
        )
        (parents first_person)
        (parents second_person)
    )
)

(putprop `Alex `parent1 `Ann)
(putprop `Alex `parent2 `Jury)
(putprop `Jane `parent1 `Ann)
(putprop `Jane `parent2 `Sebastian)
(putprop `Bob `parent1 `Helga)
(putprop `Bob `parent2 `Ron)

(print (sisterbrotherp `Alex `Jane))
(print (sisterbrotherp `Alex `Bob))