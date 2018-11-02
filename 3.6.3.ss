; Unrelated procedures and syntactical forms are omitted
(library (grades)
  (export distribution histogram)
  (import (rnrs))
  (define dist
    (lambda (ls)
      (map
        (lambda (g)
          (list
            (apply
              + (map (lambda (x) (if (eq? x g) 1 0)) ls))
            g))
        '(a b c d f))))
  (define-syntax distribution
    (syntax-rules ()
      [(_ g ...)
       (dist '(g ...))]))
  (define repeat
    (lambda (n f)
      (let r ([n n])
        (when (> n 0)
          (f)
          (r (- n 1))))))
  (define histogram
    (lambda (out dist)
      (for-each
        (lambda (entry)
          (let ([n (car entry)] [g (cadr entry)])
            (put-datum out g)
            (put-string out ": ")
            (repeat n (lambda () (put-string out "*")))
            (put-string out "\n")))
        dist))))
