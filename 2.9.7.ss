(define make-cyclic
  (lambda ()
    (let ([ls (cons 'a '())])
      (set-cdr! ls ls)
      ls)))

(make-cyclic)
; Prints a warning "cycle detected", and shows the value as #0=(a . #0#)

(length (make-cyclic))
; Throws exception: (a a a a a a ...) is circular
