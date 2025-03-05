;; -------------------------------------------------------------
;; Ejercicio 1: Obtener el primer elemento de una lista.
(defun primer-elemento (lista)
  (car lista))  ;; `car` devuelve el primer elemento de la lista.

;; -------------------------------------------------------------
;; Ejercicio 2: Obtener el segundo elemento de una lista.
(defun segundo-elemento (lista)
  (car (cdr lista)))  ;; `cdr` obtiene la lista sin el primer elemento, y `car` toma el primer elemento de esa nueva lista.

;; -------------------------------------------------------------
;; Ejercicio 3: Obtener el último elemento de una lista.
(defun ultimo-elemento (lista)
  (if (null (cdr lista))  ;; Si la lista solo tiene un elemento, lo retornamos.
      (car lista)
      (ultimo-elemento (cdr lista))))  ;; Llamamos recursivamente hasta que `cdr` sea `nil`.

;; -------------------------------------------------------------
;; Ejercicio 4: Calcular la longitud de una lista.
(defun longitud-lista (lista)
  (if (null lista)  ;; Si la lista está vacía, la longitud es 0.
      0
      (+ 1 (longitud-lista (cdr lista)))))  ;; Sumamos 1 y llamamos recursivamente con el resto de la lista.

;; -------------------------------------------------------------
;; Ejercicio 5: Sumar todos los elementos de una lista.
(defun suma-lista (lista)
  (if (null lista)  ;; Si la lista está vacía, la suma es 0.
      0
      (+ (car lista) (suma-lista (cdr lista)))))  ;; Sumamos el primer elemento con la suma del resto de la lista.

;; Pruebas de los ejercicios
(format t "Primer elemento: ~A~%" (primer-elemento '(10 20 30 40)))  ;; 10
(format t "Segundo elemento: ~A~%" (segundo-elemento '(10 20 30 40)))  ;; 20
(format t "Último elemento: ~A~%" (ultimo-elemento '(10 20 30 40)))  ;; 40
(format t "Longitud de la lista: ~A~%" (longitud-lista '(10 20 30 40)))  ;; 4
(format t "Suma de la lista: ~A~%" (suma-lista '(10 20 30 40)))  ;; 100





;; -------------------------------------------------------------
;; Ejercicio 6: Verificar si un elemento está en una lista.
(defun elemento-en-lista (elem lista)
  (if (null lista)  ;; Si la lista está vacía, el elemento no está.
      nil
      (or (equal elem (car lista))  ;; Si el primer elemento es el buscado, retornamos `t`.
          (elemento-en-lista elem (cdr lista)))))  ;; Llamada recursiva con el resto de la lista.

;; -------------------------------------------------------------
;; Ejercicio 7: Invertir una lista.
(defun invertir-lista (lista)
  (if (null lista)  ;; Caso base: si la lista está vacía, retornamos `nil`.
      nil
      (append (invertir-lista (cdr lista)) (list (car lista)))))  ;; Agregamos el primer elemento al final.

;; -------------------------------------------------------------
;; Ejercicio 8: Eliminar todas las ocurrencias de un elemento en una lista.
(defun eliminar-ocurrencias (elem lista)
  (if (null lista)  ;; Si la lista está vacía, retornamos `nil`.
      nil
      (if (equal elem (car lista))  ;; Si el primer elemento es el que queremos eliminar...
          (eliminar-ocurrencias elem (cdr lista))  ;; Lo ignoramos y seguimos con el resto.
          (cons (car lista) (eliminar-ocurrencias elem (cdr lista))))))  ;; Si no, lo agregamos al resultado.

;; -------------------------------------------------------------
;; Ejercicio 9: Obtener el enésimo elemento de una lista.
(defun enesimo-elemento (n lista)
  (if (or (null lista) (< n 0))  ;; Si la lista está vacía o `n` es negativo, retornamos `nil`.
      nil
      (if (= n 0)  ;; Si `n` es 0, significa que hemos llegado al elemento deseado.
          (car lista)
          (enesimo-elemento (- n 1) (cdr lista)))))  ;; Llamada recursiva reduciendo `n`.

;; -------------------------------------------------------------
;; Ejercicio 10: Concatenar dos listas.
(defun concatenar-listas (lista1 lista2)
  (if (null lista1)  ;; Si la primera lista está vacía, devolvemos la segunda.
      lista2
      (cons (car lista1) (concatenar-listas (cdr lista1) lista2))))  ;; Agregamos el primer elemento y seguimos.

;; -------------------------------------------------------------
;; Pruebas de los ejercicios:
(format t "Elemento en lista (3 en '(1 2 3 4)): ~A~%" (elemento-en-lista 3 '(1 2 3 4)))  ;; t
(format t "Lista invertida '(1 2 3 4)': ~A~%" (invertir-lista '(1 2 3 4)))  ;; (4 3 2 1)
(format t "Eliminar 2 de '(1 2 3 2 4)': ~A~%" (eliminar-ocurrencias 2 '(1 2 3 2 4)))  ;; (1 3 4)
(format t "Enésimo elemento (2 de '(10 20 30 40)'): ~A~%" (enesimo-elemento 2 '(10 20 30 40)))  ;; 30
(format t "Concatenar '(1 2)' y '(3 4)': ~A~%" (concatenar-listas '(1 2) '(3 4)))  ;; (1 2 3 4)
