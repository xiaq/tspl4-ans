((car (cdr (list + - * /))) 17 5)

; 1. All of list, +, -, *, / evaluate to the procedures they are bound to.
; 2. (list + - * /) evaluates to a list of 4 procedures (+ - * /).
; 3. (cdr (list + - * /)) evaluates to a list of 3 procedures (- * /).
; 4. (car (cdr (list + - * /))) evaluates to the procedure bound to -.
; 5. The numbers 17 and 5 evaluate to themselves.
; 6. The entire expression evaluates to 12 by applying - to 17 and 5.
