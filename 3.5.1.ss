(define calc #f)
(let ()
  (define do-calc
    (lambda (ek expr)
      (cond
        [(number? expr) expr]
        [(and (list? expr) (= (length expr) 3))
         (let ([op (car expr)] [args (cdr expr)])
           (case op
             [(add) (apply-op ek + args)]
             [(sub) (apply-op ek - args)]
             [(mul) (apply-op ek * args)]
             [(div) (apply-op ek / args)]
             [else (complain ek "invalid operator" op)]))]
        [else (complain ek "invalid expression" expr)])))
  (define apply-op
    (lambda (ek op args)
      (op (do-calc ek (car args)) (do-calc ek (cadr args)))))
  (define-syntax complain
    (syntax-rules ()
      [(_ ek msg expr) (ek (list msg expr))]))
  (set! calc
    (lambda (expr)
      ; grab an error continuation ek
      (call/cc
        (lambda (ek)
          (do-calc ek expr))))))
