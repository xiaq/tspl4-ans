(define double-any (lambda (f x) (f x x)))

(double-any double-any double-any) ; infinite recursion
