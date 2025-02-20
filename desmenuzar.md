```lisp
#|
(defun desmenuzar (lista)
  (when lista  ; 
    (format t "~A " (car lista))  ; 
    (format t "~A~%" (cdr lista))  ; 
    (desmenuzar (cdr lista))))  ; 
|#

(defun desmenuzar-pares (lista)
  (when lista  ; 
    (when (evenp (car lista))  ; 
      (format t "~A " (car lista)))  ; 
    (desmenuzar-pares (cdr lista))))  ;
