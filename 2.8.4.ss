(define my-list-ref
  (lambda (li n)
    (if (= n 0)
        (car li)
        (my-list-ref (cdr li) (- n 1)))))

(define my-list-tail
  (lambda (li n)
    (if (= n 0)
        (cdr li)
        (my-list-tail (cdr li) (- n 1)))))
