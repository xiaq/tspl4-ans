(let* ([n/k (call/cc (lambda (k) (cons 0 k)))]
       [n (car n/k)] [k (cdr n/k)])
  (display n) (newline) (k (cons (+ n 1) k)))
