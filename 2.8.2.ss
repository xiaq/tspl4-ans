; A version of append for two arguments
(define my-append
  (lambda (li1 li2)
    (if (null? li1)
        li2
        (cons (car li1) (my-append (cdr li1) li2)))))

; Swapping the order of the arguments in the recursive call
(define f
  (lambda (li1 li2)
    (if (null? li1)
        li2
        (cons (car li1) (f li2 (cdr li1))))))

; The result is interleaving l1 and l2:

(f '(1 2) '(a b)) ; => (1 a 2 b)

(f '(1 2 3 4) '(a b)) ; => (1 a 2 b 3 4)

(f '(1 2) '(a b c d)) ; => (1 a 2 b c d)
