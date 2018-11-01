; Original form
(or (memv x '(a b c)) (list x))

; Step 1: expand or
(let ([t (memv x '(a b c))])
  (if t t (or (list x))))

; Step 2: expand or
(let ([t (memv x '(a b c))])
  (if t t (list x)))
