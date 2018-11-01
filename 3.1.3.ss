(define-syntax let*
  (syntax-rules ()
    [(_ () b1 b2 ...)
     (begin b1 b2 ...)]
    [(_ ([x1 e1] [x2 e2] ...) b1 b2 ...)
     (let ([x1 e1])
       (let* ([x2 e2] ...)
         b1 b2 ...))]))
