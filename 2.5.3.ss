(lambda (f x) (f x)) ; no free variables

(lambda (x) (+ x x)) ; +

(lambda (x y) (f x y)) ; f

(lambda (x)
  (cons x (f x y))) ; cons f y

(lambda (x)
  (let ([z (cons x y)])
    (x y z))) ; cons y

(lambda (x)
  (let ([y (cons x y)])
    (x y z))) ; cons y z
