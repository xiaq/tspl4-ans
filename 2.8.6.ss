(define my-even?
  (lambda (x)
    (cond
      [(= x 0) #t]
      [(< x 0) (my-odd? (+ x 1))]
      [else    (my-odd? (- x 1))])))
(define my-odd?
  (lambda (x)
    (cond
      [(= x 0) #f]
      [(< x 0) (my-even? (+ x 1))]
      [else    (my-even? (- x 1))])))
