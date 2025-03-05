;; -------------------------------------------------------------
;; Akinator: Adivina un personaje basado en preguntas.
;; -------------------------------------------------------------

;; Función recursiva que recorre la estructura de datos y realiza preguntas hasta encontrar el personaje.
(defun recorre (lista)
  (when lista  ;; Verifico si la lista aún tiene elementos.
    (let* ((elemento (car lista))  ;; Tomo el primer elemento de la lista.
           (categoria (car elemento))  ;; Extraigo la categoría principal (ejemplo: "heroe", "villano").
           (sublista (cdr elemento)))  ;; Obtengo la sublista de la categoría actual.

      ;; Pregunto al usuario si su personaje pertenece a la categoría actual.
      (format t "¿Tu personaje pertenece a ~a? (si/no)~%" categoria)
      (setq a (read))  ;; Leo la respuesta del usuario.

      ;; Si el usuario responde "si", busco en la sublista correspondiente.
      (if (string-equal a "si")
          (let ((subcategoria (assoc categoria lista)))  ;; Uso `assoc` para buscar la subcategoría en la lista.
            ;; Si la subcategoría existe y tiene más subniveles, sigo preguntando.
            (if (and subcategoria (listp (cdr subcategoria)))
                (recorre (cdr subcategoria))  ;; Llamo recursivamente a `recorre` con la sublista.

                ;; Si ya no hay más niveles, pregunto por cada personaje en la sublista.
                (dolist (personaje (cdr subcategoria))
                  (format t "¿Tu personaje es ~a? (si/no)~%" personaje)
                  (setq a (read))  ;; Leo la respuesta del usuario.
                  (when (string-equal a "si")
                    (format t "¡Adiviné! Tu personaje es ~a.~%" personaje)
                    (return-from recorre)))))  ;; Termino la función si se encuentra el personaje.

      ;; Si la respuesta es "no", sigo recorriendo la lista de categorías.
      (recorre (cdr lista)))))

;; -------------------------------------------------------------
;; categorías, subcategorías y personajes.
;; -------------------------------------------------------------
(defparameter *marvel*
  '((heroe
     ("tecnologia" "Iron Man" "War Machine")
     ("mutante" "Wolverine" "Jean Grey")
     ("dios" "Thor")
     ("magia" "Doctor Strange" "Scarlet Witch"))
    
    (villano
     ("tecnologia" "Ultron")
     ("mutante" "Magneto" "Mystique")
     ("dios" "Loki")
     ("magia" "Dormammu"))
    
    (antiheroe
     ("simbiote" "Venom" "Carnage")
     ("humano" "Punisher")
     ("mutante" "Deadpool"))
    
    (cosmico
     ("guardianes" "Star-Lord" "Rocket Raccoon")
     ("entidad" "Galactus" "The Watcher")
     ("titán" "Thanos"))))

;; -------------------------------------------------------------
;; Iniciar el juego automáticamente.
;; -------------------------------------------------------------
(format t "Bienvenido al Akinator de Marvel.~%")
(recorre *marvel*)  ;; Llamo a la función principal para iniciar el juego.
