;; -------------------------------------------------------------
;; Calcular el sueldo de un trabajador según su antigüedad.
;; -------------------------------------------------------------

;; Defino una función llamada `calcular-sueldo`, que recibe dos parámetros:
;; `antiguedad` (número de años trabajados) y `sueldo` (sueldo base del trabajador).
(defun calcular-sueldo (antiguedad sueldo)
  (cond
    ;; Si el trabajador tiene más de 10 años de antigüedad, se le aplica un aumento del 10%.
    ((> antiguedad 10) 
     (* sueldo 1.10))

    ;; Si tiene más de 5 años pero no supera los 10, el aumento es del 7%.
    ((and (> antiguedad 5) (<= antiguedad 10)) 
     (* sueldo 1.07))

    ;; Si tiene más de 3 años pero menos de 5, el aumento es del 5%.
    ((and (> antiguedad 3) (<= antiguedad 5)) 
     (* sueldo 1.05))

    ;; Si tiene menos de 3 años, se le aplica un aumento del 3%.
    ((< antiguedad 3) 
     (* sueldo 1.03))

    ;; Si no se cumple ningún criterio (esto es solo como respaldo), el sueldo no cambia.
    (t sueldo)))

;; Función que solicita al usuario la antigüedad y calcula el sueldo ajustado.
(defun obtener-antiguedad-y-calcular-sueldo ()
  (format t "Introduce la antigüedad del trabajador (en años): ") ;; Solicito al usuario la antigüedad.
  (let ((antiguedad (parse-integer (read-line)))  ;; Leo la entrada del usuario y la convierto a número.
        (sueldo-base 40000))  ;; Defino un sueldo base de 40,000.

    ;; Uso `when` para asegurarme de que la antigüedad ingresada es válida (entre 1 y 100 años).
    (when (and (> antiguedad 0) (< antiguedad 100))
      ;; Si la antigüedad es válida, llamo a la función `calcular-sueldo` y muestro el resultado.
      (format t "El sueldo calculado es: ~A€~%" (calcular-sueldo antiguedad sueldo-base)))

    ;; Uso `unless` para mostrar un mensaje de error si la antigüedad ingresada no es válida.
    (unless (and (> antiguedad 0) (< antiguedad 100))
      (format t "Antigüedad inválida. Introduce un valor entre 1 y 100 años.~%"))))

;; Llamo a la función para que inicie el proceso de solicitud de datos y cálculo del sueldo.
(obtener-antiguedad-y-calcular-sueldo)
