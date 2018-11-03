; If a procedure finishes without calling `pause`, it will return to the point
; within the last procedure that called `pause`, or if it is the last
; procedure being executed, return to `start`. In the first case, it will
; leave a superfluous element in `lwp-list`, because every time control is
; transfered, the new continuation should be removed from `lwp-list`, a direct
; return violates this rule.

; The following is just a slight variance of the reference answer. I tried to
; come up with my own version, which correctly captures a `kquit` continuation
; within `start`, but has two problems:
;
; * `pause` still calls `start`, which means that the continuation is
;    overriden every time;
;
; * `quit` always calls `kquit`.
;
; Combined, this means that `quit` will wind back the execution and cause some
; code to execute twice.
;
; This reference solution is free from this problem because it factors out a
; `next` procedure, so that `kquit` is never overriden during one invocation
; of `start`.
;
; Note how the `quit` procedure only quits the process when all the other
; processes cooperate; if another process finishes without calling `quit`, the
; rest of the procedure may still be executed.

(define lwp-list '())
(define lwp
  (lambda (thunk)
    (set! lwp-list (append lwp-list (list thunk)))))

(define kquit #f)

(define start
  (lambda ()
    (call/cc
      (lambda (k)
        (set! kquit k)
        (next)))
    (set! kquit #f)))

(define next
  (lambda ()
    (unless (null? lwp-list)
      (let ([p (car lwp-list)])
        (set! lwp-list (cdr lwp-list))
        (p)))))

(define pause
  (lambda ()
    (call/cc
      (lambda (k)
        (lwp (lambda () (k #f)))
        (next)))))

(define quit
  (lambda ()
    (if (null? lwp-list)
        (kquit)
        (next))))

; This illustrates the problem described near the top of this file. Running
; this will cause zxaa to be printed. Because the second process finishes
; without calling (quit), control transfers back to the point before (display
; "a") of the first process, causing the first "a" to be printed. However, a
; continuation remains in lwp-list, and the call to (quit) will call that
; continuation, which prints another "a". The second call to (quit) terminates
; the entire run.
(lwp (lambda () (display "z") (pause) (display "a") (quit)))
(lwp (lambda () (display "x")))
(start)
