; |---------------------------------------------------------------------------------|
; | PyLisp dialect for Common Lisp 													|
; |---------------------------------------------------------------------------------|
; | Язык предоставляет некоторые конструкции, 										|
; | использовать которые можно схожим с Python образом.								|
; | Всего предоставляется 5 конструкций:											|
; | 1. Измерение длины списка [пр. python: len(arr)]								|
; | 2. Генератор диапазона [пр. python2: xrange(1, 50, 2)]							|
; | 3. Полный список элементов диапазона [пр. python2: range(1, 50, 2)]				|
; | 4. Генератор списка [пр. python: [x for x in [1, 3, 5, 2, 1, 3, 4] if x < 4]]	|
; | 5. Подсписки, доступ к элементу списка по индексу (slices, item assignment)		|
; | [пр. python: arr[2:30:3], arr[15]]												|
; |---------------------------------------------------------------------------------|
(require "lang.lisp")
;
;
; 1. len(arr)
(print (len `(1 2 4 2 3)))
;
; 5
;
;-----------------------------------------------------------------------------------|
;
; 2. range(1, 17, 3)
(print (range :from 1 :to 17 :step 3))
;
; (1 4 7 10 13 16)
;
;-----------------------------------------------------------------------------------|
;
; 3. [x for x in [1, 3, 5, 2, 1, 3, 4] if x < 4]
(print (x for x in `(1 3 5 2 1 3 4) if x < 4))
;
; (1 3 2 1 3)
;
;-----------------------------------------------------------------------------------|
;
; 4. arr[1:6:2]
(print (sublist `(0 1 2 3 4 5 6 7) :from 1 :to 6 :by 2))
;
; (1 3 5)
;
;-----------------------------------------------------------------------------------|
;
; 5. arr[6]
(print (sublist `(0 1 2 3 4 5 6 7) :index 6))
;
; 6
;