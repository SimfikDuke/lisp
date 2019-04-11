# lisp  

Лисп (LISP, от англ. LISt Processing language — «язык обработки списков»; современное написание: Lisp) — семейство языков программирования, программы и данные в которых представляются системами линейных списков символов. Лисп был создан Джоном Маккарти для работ по искусственному интеллекту и до сих пор остаётся одним из основных инструментальных средств в данной области. Применяется он и как средство обычного промышленного программирования, от встроенных скриптов до веб-приложений массового использования, хотя популярным его назвать нельзя.
  
# 1. Основы языка Лисп  
  
## Задание 9  
Определите функцию, разделяющую исходный список на два подсписка. В первый из них должны попасть элементы с нечетными номерами, во второй — элементы с четными номерами.  
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
(defun sep (lst)
                (cond 
                    ((null lst) NIL)
                    (t 
			((lambda (nlst)
				(list
					(cons (car lst) (car nlst))
					(cons (cadr lst) (cadr nlst))
				))
			(sep (cddr lst)))
                    )
                )
)
```  
</p>
</details>


## Задание 19  
Определите функцию (ЛУКОВИЦА n), строящую N-уровневый вложенный список, элементом которого на самом глубоком уровне является N.  
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
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
```  
</p>
</details>


## Задание 25  
Определите функцию, удаляющую из списка каждый четный элемент.  
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
(defun deleven (lst)
                (cond 
                    ((null lst) NIL)
                    (t 
                        (cons (car lst) (deleven (cddr lst)))
                    )
                )
)
```  
</p>
</details>


# Задание 26  
Определите функцию, разбивающую список (a b с d...) на пары ((а b) (с d)...).
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
(defun pairs (lst)
                (cond 
                    ((null lst) NIL)
                    (t 
                        (cons (list (car lst) (cadr lst)) (pairs (cddr lst)))
                    )
                )
)
```  
</p>
</details>

## Задание 29  
Определите функцию, вычисляющую глубину списка (самой глубокой ветви).
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
(defun maxdeep (lst)(
        cond
        ((atom lst) 0)
        (t
            (
                max (+ 1 (maxdeep (car lst))) (maxdeep (cdr lst))
            )
        )
    )
)
```  
</p>
</details>


## Задание 34  
Определите предикат РАВЕНСТВО-МНОЖЕСТВ, проверяющий совпадение двух множеств (независимо от порядка следования элементов). Подсказка: напишите
функцию УДАЛИТЬ, удаляющую данный элемент из множества.
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
(defun delel (lst el)
    (
        (lambda (first rest)
            (cond
                ((null lst) NIL)
                ((= first el) rest)
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

(defun equal_lists_p (lst1 lst2)
    (and
        (null (diff lst1 lst2))
        (null (diff lst2 lst1))
    )
)
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
(print (equal_lists_p `(1 2 3 4) `(1 4)))
(print (equal_lists_p `(1 2 3 4) `(1 2 3 4)))
(print (equal_lists_p `(1 2 3 4) `(2 1 4 3)))

;NIL
;T
;T
```  
</p>
</details>


## Задание 36  
Определите предикат НЕПЕРЕСЕКАЮЩИЕСЯ, проверяющий, что два множества не
пересекаются, т.е. у них нет общих элементов.
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
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
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
(print (intersectp `(1 2 3 4) `(1 4)))
(print (intersectp `(This is not) `(intersected case)))
(print (intersectp `(1 2 3 4) `(1 2 3 4)))
(print (intersectp `(1 2 3 4) `(6 7 8)))

;NIL
;T
;NIL
;T
```  
</p>
</details>


## Задание 40  
Определите функцию РАЗНОСТЬ, формирующую разность двух множеств, т.е.
удаляющую из первого множества все общие со вторым множеством элементы.
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
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
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
(print (diff `(1 2 3 4) `(1 4)))
(print (diff `(1 2 3 4) `(1 2 3 4)))
(print (diff `(1 2 3 4) `(6 7 8)))
(print (diff `(There is no elements in list) `(no)))

;(2 3) 
;NIL 
;(1 2 3 4) 
;(THERE IS ELEMENTS IN LIST) 
```  
</p>
</details>


## Задание 45  
Предположим, что у имени города есть свойства х и у, которые содержат координаты места нахождения города относительно некоторого начала координат.
Напишите функцию (РАССТОЯНИЕ a b), вычисляющую расстояние между городами а и b
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
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
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp

(set_city :city_name `Simferopol :x 150 :y 135)
(set_city :city_name `Sevastopol :x 200 :y 50)

(print (distantion `Simferopol `Sevastopol))

;98.61542
```  
</p>
</details>


## Задание 46  
Предположим, что отец и мать некоторого лица, хранятся как значения соответствующих свойств у символа, обозначающего это лицо. Напишите функцию (РОДИТЕЛИ x), которая возвращает в качестве значения родителей, и предикат (СЕСТРЫ-БРАТЬЯ x1 x2), который истинен в случае, если x1 и x2 — сестры или братья, родные или с одним общим родителем.
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
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
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
(putprop `Alex `parent1 `Ann)
(putprop `Alex `parent2 `Jury)
(putprop `Jane `parent1 `Ann)
(putprop `Jane `parent2 `Sebastian)
(putprop `Bob `parent1 `Helga)
(putprop `Bob `parent2 `Ron)

(print (sisterbrotherp `Alex `Jane))
(print (sisterbrotherp `Alex `Bob))

;T
;NIL
```  
</p>
</details>  


# Функции высших порядков


## Задание 1  
Определите *FUNCALL* через функционал *APPLY*.
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
(defun fun-call (f &rest args)
	(apply f args)
)
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
(defun fun-call (f &rest args)
	(apply f args)
)
	      
(defun my-func (&rest args) (print args))
              
(fun-call `my-func 1 2 3)
;(1 2 3) 
```  
</p>
</details>  


## Задание 3  
Определите функционал (APL-APPLY f x), который применяет каждую функцию fi списка (f1 f2 ... fn) к соответствующему элементу списка x = (x1 x2 ... xn) и возвращает список, сформированный из результатов.  
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
(defun apl-apply (f_list x_args)
	(
		(lambda (first_f rest_f first_x rest_x)
				(cond
					((null first_f) nil)
					(t 
						(append 
							(list (apply first_f (list first_x)))
							(apl-apply rest_f rest_x)
						)
					)
				)
		)
		(car f_list)
		(cdr f_list)
		(car x_args)
		(cdr x_args)
	)
)
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
(defun f1 (x) (+ x 1))
(defun f2 (x) (+ x 2))
(defun f3 (x) (+ x 3))
 
(print (apl-apply `(f1 f2 f3) `(10 20 30)))
;(11 22 33) 
```  
</p>
</details>   


## Задание 5  
Определите функциональный предикат(НЕКОТОРЫй пред список),который истинен, когда, являющейся функциональным аргументом предикат пред истинен хотя бы для одного элемента списка список.  
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
(defun any-of-p (funcp args)
	(
		(lambda (first-arg rest-args)
			(
				cond
				((null args) nil)
    			((apply funcp (list first-arg)) t)
				(t
					(any-of-p funcp rest-args)
				)
			)
		)
		(car args)
		(cdr args)
	)
)
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
(defun eq-to-two-p (val) (cond ((eq val 2)) (t nil)))

(print (any-of-p `eq-to-two-p `(1 3 4 5)))
(print (any-of-p `eq-to-two-p `(1 3 4 5 2 3)))
; NIL
; T
```  
</p>
</details>   


## Задание 7  
Определите фильтр (УДАЛИТЬ-ЕСЛИ-НЕ пред список), удаляющий из списка список все элементы, которые не обладают свойством, наличие которого проверяет предикат пред.  
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
(defun del-if-not (pred lst)
	(
		(lambda (first rest)
			(cond
				((null lst) nil)
				(t
      				(
						(lambda (result-of-rest)
							(cond
	       						((apply pred (list first))
	              					(cons first result-of-rest))
	       						(t result-of-rest)
	            			)
						)
	     				(del-if-not pred rest)
          			)
				)
			)
		)
		(car lst)
		(cdr lst)
	)
)
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
(defun check-x-prop-p (sym)
	(cond
		((null (get sym `x)) nil)
		(t t)
	)
)

(setf (get `A `x) 10)
(setf (get `B `x) 20)
(setf (get `C `x) 30)

(print (del-if-not `check-x-prop-p `(A B D C F)))
;(A B C)
```  
</p>
</details>   


## Задание 9  
Напишите генератор порождения чисел Фибоначчи: 0, 1, 1, 2, 3, 5, ... 
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
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
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
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
```  
</p>
</details>   


## Задание 11  
Определите фукнционал МНОГОФУН, который использует функции, являющиеся аргументами, по следующей схеме:
(МНОГОФУН ’(f g ... h) x) ⇔ (LIST (f x) (g x) ... (h x)). 
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
(defun many-fun (funcs x)
  ((lambda (first-func rest-funcs)
     (cond
       ((null funcs) nil)
       (t (append
            (list (apply first-func (list x)))
            (many-fun rest-funcs x)))))
   (car funcs) (cdr funcs)))
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
(defun mlt (x) (* x 5))
(defun pls (x) (+ x 5))
(defun dvd (x) (/ x 5))

(print (many-fun `(mlt pls dvd) 10))
(print (many-fun `(dvd mlt pls) 45))
; (50 15 2) 
; (9 225 50)
```  
</p>
</details>  