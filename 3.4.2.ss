(define retry #f)

; The initial value of k is simply the identify function; this ensures that
; the inner fac function as well as the outer factorial function has a return
; value.
(define factorial
  (lambda (x)
    (let fac ([x x] [k (lambda (v) v)])
      (if (= x 0)
          (begin
            (set! retry k)
            (k 1))
          (fac (- x 1) (lambda (v) (k (* x v))))))))
