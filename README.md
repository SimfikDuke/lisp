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
