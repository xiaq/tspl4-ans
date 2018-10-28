; It mirrors the original tree
(define tree-mirror
  (lambda (tr)
    (if (not (pair? tr))
        tr
        (cons (tree-mirror (cdr tr))
              (tree-mirror (car tr))))))
