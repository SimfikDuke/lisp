# lisp  

Лисп (LISP, от англ. LISt Processing language — «язык обработки списков»; современное написание: Lisp) — семейство языков программирования, программы и данные в которых представляются системами линейных списков символов. Лисп был создан Джоном Маккарти для работ по искусственному интеллекту и до сих пор остаётся одним из основных инструментальных средств в данной области. Применяется он и как средство обычного промышленного программирования, от встроенных скриптов до веб-приложений массового использования, хотя популярным его назвать нельзя.

# Задание 9  
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


# Задание 19  
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


# Задание 25  
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

# Задание 29  
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


# Задание 34  
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


# Задание 36  
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


# Задание 40  
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


# Задание 45  
Предположим, что у имени города есть свойства х и у, которые содержат координаты места нахождения города относительно некоторого начала координат.
Напишите функцию (РАССТОЯНИЕ a b), вычисляющую расстояние между городами а и b
<details><summary>Решение</summary>
<p>  

#### Код на LISP  

```lisp
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
```  
</p>
</details>  
<details><summary>Тесты</summary>
<p>  

#### Код на LISP  

```lisp
(putprop `Simferopol `x 150)
(putprop `Simferopol `y 135)
(putprop `Sevastopol `x 200)
(putprop `Sevastopol `y 50)

(print (distantion `Simferopol `Sevastopol))
;98.61542
```  
</p>
</details>


# Задание 46  
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

<!---
Скриншот:  

![scrnsht](https://wmpics.pics/di-FTFP.png)  

--->

<!---
Скриншот:  

![scrnsht](https://i109.fastpic.ru/big/2019/0309/62/344f05d74a8000a92be6f2f4ebd0ba62.png)  

--->

<!---
Скриншот:  

![scrnsht](https://i109.fastpic.ru/big/2019/0309/0f/4a1f4f430a5b6839b10769dba3a5270f.png)  

--->

<!---
Скриншот:  

![scrnsht](https://i109.fastpic.ru/big/2019/0309/05/206531cbed377f670808b7658daa1e05.png)  

--->

<!---
Скриншот:  

![scrnsht](https://i110.fastpic.ru/big/2019/0309/4c/00d321c1d8e7fbea148f026bd045e64c.png)  

--->
<!---
Скриншот:  

![scrnsht](https://i109.fastpic.ru/big/2019/0310/0b/5eb4ef2217217d516777fb5b10d2ed0b.png)  

--->
