```lisp
(defun suma ()
  ;(+ a b)
  (setq c '(+ 4 5))
  (princ c)
  (setq d (eval c))
  (princ d)
  (format t "~% resultado ~D " d)
)

