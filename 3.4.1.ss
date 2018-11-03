(define reciprocal
  (lambda (n success failure)
    (if (= n 0)
        (failure "divided by 0")
        (success (/ 1 n)))))
