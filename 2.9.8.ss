(define my-list-inner?
  (lambda (p q)
    (if (eq? p q)
        #f
        (or (null? q)
            (and (pair? q)
                 (or (null? (cdr q))
                     (my-list-inner? (cdr p) (cddr q))))))))

(define my-list?
  (lambda (x)
    (or
      (null? x)
      (and (pair? x)
           (my-list-inner? x (cdr x))))))

(my-list? "a") ; => #f

(my-list? 'a) ; => #f

(my-list? '()) ; => #t

(my-list? '(1)) ; => #t

(my-list? '(1 2)) ; => #t

(my-list? '(1 . 2)) ; => #f

(my-list? '(1 2 3)) ; => #t

(my-list? (let ([ls (cons 'a '())])
            (set-cdr! ls ls)
            ls)) ; => #f
