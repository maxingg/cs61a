; Q1
(define (compose-all funcs)
  (define (helper flist x)
    (if (null? flist) x
      (helper (cdr flist) ((car flist) x))))
  (lambda (x) (helper funcs x))
)

; Q2
(define (tail-replicate x n)
  (define (helper res num)
    (if (<= num 0) res
    (helper (cons x res) (- num 1)))
  )
  (helper nil n)
)