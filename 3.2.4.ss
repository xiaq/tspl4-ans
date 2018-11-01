; Let f(n) be the number of calls to fib to compute fib(n).

; f(n) = f(n-1) + f(n-2) + 1
; g(n) = g(n-1) + g(n-2) -- g(n) = f(n)+1
; f(0) = f(1) = 1
; g(0) = f(0) = 2
;
; g(n) = fib(n+1) * 2
; f(n) = fib(n+1) * 2 - 1

(define fib-called 0)

(define fibonacci
  (lambda (n)
    (set! fib-called 0)
    (let fib ([i n])
      (set! fib-called (+ 1 fib-called))
      (cond
        [(= i 0) 0]
        [(= i 1) 1]
        [else (+ (fib (- i 1)) (fib (- i 2)))]))))

; fib is called n times.
(define fibonacci
  (lambda (n)
    (set! fib-called 0)
    (if (= n 0)
        0
        (let fib ([i n] [a1 1] [a2 0])
          (set! fib-called (+ 1 fib-called))
          (if (= i 1)
              a1
              (fib (- i 1) (+ a1 a2) a1))))))

