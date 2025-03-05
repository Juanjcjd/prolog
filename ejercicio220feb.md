;; -------------------------------------------------------------
;; Determinar el nivel de agua y litros según el peso de la ropa
;; -------------------------------------------------------------

;; Defino una plantilla (deftemplate) llamada 'ropa' con un solo campo 'peso'.
(deftemplate ropa
  (slot peso))

;; Creo un hecho inicial con peso en 0, para tener un dato de referencia.
(deffacts datos-iniciales
  (ropa (peso 0))) ;; Se inicializa con 0 para evitar errores en la ejecución.

;; Regla que determina el nivel de agua y la cantidad de litros que se necesitan.
(defrule determinar-nivel
  "Regla que determina el nivel de agua y la cantidad de litros según el peso ingresado."
  (declare (salience 10)) ;; Se asigna una alta prioridad a esta regla para que se ejecute primero.
  ?r <- (ropa (peso ?p)) ;; Se recupera el peso de la ropa.
  =>
  ;; Primero verifico si el peso es mayor a 30 libras, si es así, la lavadora no funcionará.
  (if (> ?p 30) then
    (printout t "Demasiado peso. La lavadora no funcionará." crlf)
  else
    ;; Si el peso es válido, asigno por defecto el nivel mínimo y 10 litros de agua.
    (bind ?nivel "Mínimo")
    (bind ?litros 10)

    ;; Ahora verifico los rangos de peso y actualizo el nivel y los litros de agua.
    (if (>= ?p 8) then
      (bind ?nivel "Medio")
      (bind ?litros 20))
    (if (>= ?p 15) then
      (bind ?nivel "Alto")
      (bind ?litros 30))
    (if (>= ?p 22) then
      (bind ?nivel "Máximo")
      (bind ?litros 40))

    ;; Finalmente, imprimo los resultados.
    (printout t "Nivel de agua: " ?nivel crlf)
    (printout t "Litros de agua necesarios: " ?litros crlf)
  )
)

;; Para probar este código, se puede insertar un hecho con el peso de la ropa, por ejemplo:
;; (assert (ropa (peso 18)))
