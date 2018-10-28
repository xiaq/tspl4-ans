(let ([x 9])
  (* x
     (let ([x (/ x 3)])
       (+ x x))))

; The inner let form binds x to 3 and evaluates to 6
; The outter let form is (* 9 6)
; Thus the value is 54
