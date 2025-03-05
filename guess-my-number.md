;; -------------------------------------------------------------
;; Adivinar un número con búsqueda binaria.
;; -------------------------------------------------------------

;; Defino dos variables globales que establecen los límites del rango de búsqueda.
(defparameter *small* 1)   ;; Límite inferior del número a adivinar.
(defparameter *big* 100)   ;; Límite superior del número a adivinar.

;; -------------------------------------------------------------
;; Función principal que hace una suposición basada en el promedio del rango.
(defun guess-my-number ()
  ;; `ash` (Arithmetic Shift) divide la suma de los límites entre 2.
  (ash (+ *small* *big*) -1))  ;; Equivalente a hacer `(small + big) / 2`.

;; -------------------------------------------------------------
;; Función que ajusta el límite superior cuando el número a adivinar es menor.
(defun smaller ()
  (setf *big* (1- (guess-my-number)))  ;; Ajusto el límite superior restando 1 al número actual.
  (guess-my-number))  ;; Hago una nueva suposición con el nuevo rango.

;; -------------------------------------------------------------
;; Función que ajusta el límite inferior cuando el número a adivinar es mayor.
(defun bigger ()
  (setf *small* (1+ (guess-my-number)))  ;; Ajusto el límite inferior sumando 1 al número actual.
  (guess-my-number))  ;; Hago una nueva suposición con el nuevo rango.

;; -------------------------------------------------------------
;; Función para reiniciar el juego estableciendo los valores iniciales.
(defun start-over ()
  (setf *small* 1
        *big* 100)  ;; Restablezco los valores originales del rango.
  (guess-my-number))  ;; Hago la primera suposición con los valores iniciales.
