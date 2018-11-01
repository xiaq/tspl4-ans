(define-syntax my-let
  (syntax-rules ()
    [(_ ([x e] ...) b1 b2 ...)
     ((lambda (x ...) b1 b2 ...) e ...)]
    [(_ name ([x e] ...) b1 b2 ...)
     (letrec [(name (lambda (x ...) b1 b2 ...))]
       (name e ...))]))
