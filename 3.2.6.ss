; The procedures even? and odd? are defined as:

(define even?
  (lambda (x)
    (or (= x 0)
        (odd? (- x 1)))))

(define odd?
  (lambda (x)
    (and (not (= x 0))
         (even? (- x 1)))))

; If or is defined as:
(define-syntax or
  (syntax-rules ()
    [(_) #f]
    [(_ e1 e2 ...)
     (let ([t e1])
       (if t t (or e2 ...)))]))

; Then the definition of even? expands to
(define even?
  (lambda (x)
    (let ([t (= x 0)])
      (if t t
          (let ([t (odd? (- x 1))])
            (if t t #f))))))

; Which is not tail-recursive, and may cause stack overflow on very large
; inputs.
