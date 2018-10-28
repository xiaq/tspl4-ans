(define data '((a b) (c d)))

(car (car data)) ; => a

(caar data)

(car (cdr (car data))) ; => b

(cadar data)

(car (car (cdr data))) ; => c

(caadr data)

(car (cdr (car (cdr data)))) ; => d

(cadadr data)
