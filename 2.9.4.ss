(define make-stack
  (lambda (n)
    (let ([vec (make-vector n)]
          [top 0])
      (lambda (msg . args)
        (case msg
          [(empty? mt?) (= 0 top)]
          [(push!) (let ([v (car args)]) (vector-set! vec top v))]
          [(top) (vector-ref vec top)]
          [(pop!) (if (= top 0) "oops" (set! top (- top 1)))]
          [(ref) (let ([i (car args)]) (vector-ref vec (- top i)))]
          [(set!) (let ([i (car args)] [v (cadr args)])
                    (vector-set! vec (- top i) v))]
          [else "oops"])))))
