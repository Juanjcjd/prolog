```lisp
(defun fibonacci (n)
  (if (= n 0) 
      0
      (if (= n 1)
          1
          (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

(let ((n 5)) ; Cambia este valor para probar otros términos
  (format t "Fibonacci de ~A es: ~A~%" n (fibonacci n)))
