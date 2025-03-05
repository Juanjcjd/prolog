;; -------------------------------------------------------------
;; Verificar requisitos de entrada a la fiesta de Martha
;; -------------------------------------------------------------

;; Defino una plantilla llamada 'persona' con un campo 'edad'.
(deftemplate persona
  (slot edad))

;; Se inicia con un hecho base con edad en 0, aunque este dato será sustituido por el usuario.
(deffacts datos-iniciales
  (persona (edad 0)))

;; Esta regla evalúa la edad de la persona y determina si puede entrar o no.
(defrule verificar-entrada
  "Regla que evalúa la edad de la persona y determina los requisitos de entrada."
  (declare (salience 10)) ;; Asigno una prioridad alta para que la regla se ejecute primero.
  ?p <- (persona (edad ?e)) ;; Obtengo la edad ingresada.
  =>
  ;; Primero verifico si la persona tiene menos de 15 años.
  (if (< ?e 15) then
    (printout t "No puedes entrar a la fiesta." crlf) ;; No se permite la entrada.
  else
    ;; Si tiene exactamente 15 años, entra gratis.
    (if (= ?e 15) then
      (printout t "Puedes entrar totalmente gratis." crlf)
    else
      ;; Si tiene más de 15 años, solo entra si trae regalo.
      (printout t "Puedes entrar solo si traes regalo." crlf)
    )
  )
)

;; Para probar este código, se puede insertar un hecho con la edad de la persona, por ejemplo:
;; (assert (persona (edad 16)))
