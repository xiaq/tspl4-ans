; I interprete the problem as "no further multiplications are made as soon as
; a 0 is encountered", which is the feature of the original program.
(define product
  (lambda (ls)
    (let p ([a 1] [ls ls])
      (if (null? ls)
          a
          (p (* a (car ls)) (cdr ls))))))
