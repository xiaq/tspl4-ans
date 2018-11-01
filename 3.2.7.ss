; The following implementation of factor fixes the 3 problems mentioned in the
; book; it is also tail-recursive.

(define factor
  (lambda (n)
    (let f ([n n] [i 2] [ls '()])
      (if
        (or (>= i n) (> (* i i) n)) (cons n ls)
        (let ([x (/ n i)])
          (if (integer? x)
              (f x i (cons i ls))
              (f n (+ i (if (= i 2) 1 2)) ls)))))))
