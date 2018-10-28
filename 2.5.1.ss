(let ([f (lambda (x) x)])
  (f 'a)) ; => a

(let ([f (lambda x x)])
  (f 'a)) ; => (a)

(let ([f (lambda (x . y) x)])
  (f 'a)) ; => a

(let ([f (lambda (x . y) y)])
  (f 'a)) ; => ()
