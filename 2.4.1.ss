(define a 10)
(define b 20)
(define c 30)

(+ (- (* 3 a) b) (+ (* 3 a) b))

; Simplified:
(let ([x (* 3 a)]) (+ (- x b) (+ x b)))

(cons (car (list a b c)) (cdr (list a b c)))

; Simplified:
(let ([li (list a b c)]) (cons (car li) (cdr li)))
