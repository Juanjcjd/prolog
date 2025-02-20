```lisp
(print (list "Resultado 1:" (cadddr '(a b c d e))))
(print (list "Resultado 2:" (caar (cddr '((1 2) (3 4) (5 6))))))
(print (list "Resultado 3:" (caar (cddr '((a b) (c d) (e f))))))
(print (list "Resultado 4:" (caar (cddr '((x y) ((p q) (r s)) (z w))))))
(print (list "Resultado 5:" (cadr (cadr (cadr '((1 (2 3)) (4 (5 6))))))))
(print (list "Resultado 6:" (cadr (car '(((a b) c) d e)))))
(print (list "Resultado 7:" (cadr (cadr '(((1 2) 3) ((4 5) 6))))))
(print (list "Resultado 8:" (cadr (cadr (car '((p (q (r s))) t u)))))) 
