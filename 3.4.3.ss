; The function map/k itself is not CPS, but it calls f using CPS. It calls it
; with two continuations, one for success -- which will continue down the rest
; of the list, one for failure -- which is just an identity function causing a
; direct return.

(define map/k
  (lambda (f ls)
    (let m ([ls ls] [k (lambda (x) x)])
      (if (null? ls)
          (k '())
          (f (car ls)
             (lambda (v)
               (m (cdr ls) (lambda (u) (k (cons v u)))))
             (lambda (x) x))))))

(define reciprocals
  (lambda (ls)
    (map/k (lambda (x success failure)
              (if (= x 0)
                  (failure "zero found")
                  (success (/ 1 x))))
            ls)))

; Below is a slight different version. It omits the failure continuation,
; because is always the identity function. So if f "falls through" without
; calling k, it signals a failure. This technique is used in the reference
; solution - in fact, the following version is almost identical to the
; reference solution.

(define map/k
  (lambda (f ls)
    (let m ([ls ls] [k (lambda (x) x)])
      (if (null? ls)
          (k '())
          (f (car ls)
             (lambda (v)
               (m (cdr ls) (lambda (u) (k (cons v u))))))))))

(define reciprocals
  (lambda (ls)
    (map/k (lambda (x k)
              (if (= x 0) "zero found" (k (/ 1 x))))
            ls)))
