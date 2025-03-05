;; -------------------------------------------------------------
;; Desmenuzar una lista e imprimir solo los números pares.
;; -------------------------------------------------------------

;; Función `desmenuzar-pares` que recorre una lista y muestra solo los números pares.
(defun desmenuzar-pares (lista)
  (when lista  ;; Verifico si la lista aún tiene elementos.
    (when (evenp (car lista))  ;; Compruebo si el primer elemento de la lista es par.
      (format t "~A " (car lista)))  ;; Si es par, lo imprimo en pantalla.

    (desmenuzar-pares (cdr lista))))  ;; Llamo recursivamente a `desmenuzar-pares` con el resto de la lista.

