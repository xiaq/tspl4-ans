(define transpose
  (lambda (li)
    (cons (map car li)
          (map cdr li))))

(transpose '((a . 1) (b . 2) (c . 3)))
