; Original form
(let ([x (memv 'a ls)])
  (and x (memv 'b x)))

; Step 1: expand and
(let ([x (memv 'a ls)])
  (if x (and (memv 'b x)) #f))

; Step 2: expand and
(let ([x (memv 'a ls)])
  (if x (memv 'b x) #f))

; Step 3: expand let
((lambda (x)
   (if x (memv 'b x) #f))
 (memv 'a ls))
