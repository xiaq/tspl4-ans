; make-queue uses null to represent an empty queue (instead of a sentinel)
(define make-queue
  (lambda ()
    '(() ())))

; emptyq? changes accordingly
(define emptyq?
  (lambda (q)
    (null? (car q))))

; assert-non-empty is unchanged (although the empty? it uses has)
(define assert-non-empty
  (lambda (q)
    (when (emptyq? q)
      (assertion-violation #f "queue must be nonempty"))))

; putq! now needs to deal with empty queues as a special case
(define putq!
  (lambda (q v)
    (let [(tail (cons v '()))]
      (if (empty? q)
          (begin (set-car! q tail)
                 (set-cdr! q tail))
          (begin (set-cdr! (cdr q) tail)
                 (set-cdr! q tail))))))

; getq is unchanged
(define getq
  (lambda (q)
    (assert-non-empty q)
    (car (car q))))

; delq! now needs to deal with one-element queues as a special case too
(define delq!
  (lambda (q)
    (assert-non-empty q)
    (let [(head (cdar q))]
      (set-car! q head)
      (when (null? head)
        (set-cdr! q '())))))

; This version saves a little bit of memory but is overall more complicated
; than the version with the sentinel, as it needs to treat empty queues as a
; special case. The version using sentinels is slightly cleaner.
