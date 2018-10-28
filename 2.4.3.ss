(let ([x 'a] [y 'b])
  (list (let ([x 'c]) (cons x y))
        (let ([y 'd]) (cons x y))))

; Rewritten
(let ([x 'a] [y 'b])
  (list (let ([newx 'c]) (cons newx y))
        (let ([newy 'd]) (cons x newy))))

(let ([x '((a b) c)])
  (cons (let ([x (cdr x)])
          (car x))
        (let ([x (car x)])
          (cons (let ([x (cdr x)])
                  (car x))
                (cons (let ([x (car x)])
                        x)
                      (cdr x))))))

; Rewritten
(let ([x '((a b) c)])
  (cons (let ([x2 (cdr x)])
          (car x2))
        (let ([x2 (car x)])
          (cons (let ([x3 (cdr x2)])
                  (car x3))
                (cons (let ([x3 (car x2)])
                        x3)
                      (cdr x2))))))
