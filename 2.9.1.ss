(define make-counter
  (lambda (init step)
    (let ([next init])
      (lambda ()
        (let ([v next])
          (set! next (+ next step))
          v)))))
