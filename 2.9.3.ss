(define make-stack
  (lambda ()
    (let ([ls '()])
      (lambda (msg . args)
        (case msg
          [(empty? mt?) (null? ls)]
          [(push!) (set! ls (cons (car args) ls))]
          [(top) (car ls)]
          [(pop!) (set! ls (cdr ls))]
          [(ref) (list-ref ls (car args))]
          [(set!) (set-car! (list-tail ls (car args)) (cadr args))]
          [else "oops"])))))