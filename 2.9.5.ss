; make-queue and put-queue are unchanged
(define make-queue
  (lambda ()
    (let ([end (cons 'ignored '())])
      (cons end end))))

(define putq!
  (lambda (q v)
    (let ([end (cons 'ignored '())])
      (set-car! (cdr q) v)
      (set-cdr! (cdr q) end)
      (set-cdr! q end))))

; Answer
(define emptyq?
  (lambda (q)
    (null? (cdar q))))

(define assert-non-empty
  (lambda (q)
    (when (emptyq? q)
      (assertion-violation #f "queue must be nonempty"))))

; Revised getq and delq
(define getq
  (lambda (q)
    (assert-non-empty q)
    (car (car q))))

(define delq!
  (lambda (q)
    (assert-non-empty q)
    (set-car! q (cdr (car q)))))
