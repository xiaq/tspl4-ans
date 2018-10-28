(define my-make-list
  (lambda (n x)
    (if (= n 0)
        '()
        (cons x (my-make-list (- n 1) x)))))
