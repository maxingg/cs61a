(define (find s predicate)
  (cond
    ((null? s) #f)
    ((predicate (car s)) (car s))
    (else (find (cdr-stream s) predicate))
  )
)

(define (scale-stream s k)
  (if (equal? s nil) nil (cons-stream (* (car s) k) (scale-stream (cdr-stream s) k)))
)

(define (has-cycle s)
  (define (in? lst s)  ;Check if stream s is in list lst
  (cond
   ((null? lst) #f)
   ((eq? (car lst) s) #t)
   (else (in? (cdr lst) s))))

 (define (has-cycle-helper memo s)
   (cond
    ((null? s) #f)
    ((in? memo s) #t)
    (else (has-cycle-helper (cons s memo) (cdr-stream s)))))

 (has-cycle-helper nil s)
)
(define (has-cycle-constant s)
  (define (cycle-helper turtle rabbit)
    (cond 
      ((or (null? rabbit) (null? (cdr-stream rabbit))) #f)
      ((eq? turtle rabbit) #t)
      (else (cycle-helper (cdr-stream turtle) (cdr-stream (cdr-stream rabbit))))
    )
  )
  (cycle-helper s (cdr-stream s))
)
