(define shorter?
  (lambda (l1 l2)
    (cond
      [(null? l1) #t]
      [(null? l2) #f]
      [else (shorter? (cdr l1) (cdr l2))])))

(define shorter
  (lambda (l1 l2)
    (if (shorter? l1 l2) l1 l2)))
