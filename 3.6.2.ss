; Unrelated procedures and syntactical forms are omitted
(library (grades)
  (export distribution)
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
       (dist '(g ...))])))
