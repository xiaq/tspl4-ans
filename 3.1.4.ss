(define-syntax when
  (syntax-rules ()
    [(_ t e1 e2 ...)
     (if t (begin e1 e2 ...) #f)]))

(define-syntax unless
  (syntax-rules ()
    [(_ t e1 e2 ...)
     (when (not t) e1 e2 ...)]))
