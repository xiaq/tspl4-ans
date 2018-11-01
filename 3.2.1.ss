; This definition of sum is not tail-recursive
(letrec ([sum (lambda (ls)
                (if (null? ls)
                    0
                    (+ (car ls) (sum (cdr ls)))))])
  (sum '(1 2 3 4 5)))

; These definitions of even? and odd? are not tail-recursive
(letrec ([even?
           (lambda (x)
             (or (= x 0)
                 (odd? (- x 1))))]
         [odd?
           (lambda (x)
             (and (not (= x 0))
                  (even? (- x 1))))])
  (list (even? 20) (odd? 20)))

; This definition or race is tail-recursive
(define list?
  (lambda (x)
    (letrec ([race
               (lambda (h t)
                 (if (pair? h)
                     (let ([h (cdr h)])
                       (if (pair? h)
                           (and (not (eq? h t))
                                (race (cdr h) (cdr t)))
                           (null? h)))
                     (null? h)))])
      (race x x))))

; The version rewritten to use named let is also tail-recursive

; This version of factorial is not tail-recursive
(define factorial
  (lambda (n)
    (let fact ([i n])
      (if (= i 0)
          1
          (* i (fact (- i 1)))))))

; This version of factorial is tail-recursive
(define factorial
  (lambda (n)
    (let fact ([i n] [a 1])
      (if (= i 0)
          a
          (fact (- i 1) (* a i))))))

; This version of fibonacci is not tail-recursive
(define fibonacci
  (lambda (n)
    (let fib ([i n])
      (cond
        [(= i 0) 0]
        [(= i 1) 1]
        [else (+ (fib (- i 1)) (fib (- i 2)))]))))

; This version of fibonacci is tail-recursive
(define fibonacci
  (lambda (n)
    (if (= n 0)
        0
        (let fib ([i n] [a1 1] [a2 0])
          (if (= i 1)
              a1
              (fib (- i 1) (+ a1 a2) a1))))))

; This version of factor is not tail-recursive
(define factor
  (lambda (n)
    (let f ([n n] [i 2])
      (cond
        [(>= i n) (list n)]
        [(integer? (/ n i))
         (cons i (f (/ n i) i))]
        [else (f n (+ i 1))]))))

; However, it can be rewritten to be tail-recursive with the help of an
; accumulator. The result is reversed compared to the original version.

(define factor
  (lambda (n)
    (let f ([n n] [i 2] [ls '()])
      (cond
        [(>= i n) (cons n ls)]
        [(integer? (/ n i))
         (f (/ n i) i (cons i ls))]
        [else (f n (+ i 1) ls)]))))
