(define data '((a b) (c d)))

(car data) ; => (a b)

(car (car data)) ; => a

(cdr (car data)) ; => (b)

(car (cdr (car data))) ; => b

(cdr (cdr (car data))) ; => ()

(cdr data) ; => ((c d))

(car (cdr data)) ; => (c d)

(car (car (cdr data))) ; => c

(cdr (car (cdr data))) ; => (d)

(car (cdr (car (cdr data)))) ; => d

(cdr (cdr (car (cdr data)))) ; => ()

(cdr (cdr data)) ; => ()
