; Q4
(define (rle s)
  (define (rle-helper res pre count)
    (cond
      ((null? res) (cons-stream (list pre count) nil))
      ((= pre (car res)) (rle-helper (cdr-stream res) pre (+ count 1)))
      (else (cons-stream (list pre count) (rle-helper (cdr-stream res) (car res) 1)))
    )
  )
  (if (null? s) ()
    (rle-helper (cdr-stream s) (car s) 1)
  )
)

; Q4 testing functions
(define (list-to-stream lst)
    (if (null? lst) nil
                    (cons-stream (car lst) (list-to-stream (cdr lst))))
)

(define (stream-to-list s)
    (if (null? s) nil
                 (cons (car s) (stream-to-list (cdr-stream s))))
)

; Q5
(define (insert n s)
  (define (insert-help head tail)
    (cond 
      ((null? tail) (append head (list n)))
      ((<= n (car tail)) (append (append head (list n)) tail))
      (else (insert-help (append head (list (car tail))) (cdr tail)))
    )
  )
  (insert-help () s)
)

; Q6
(define (deep-map fn s)
  (cond
    ((null? s) nil)
    ((list? (car s)) (cons (deep-map fn (car s)) (deep-map fn (cdr s))))
    (else (cons (fn (car s)) (deep-map fn (cdr s))))
  )
)

; Q7
; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s) nil
      (cons (fn (car s))
            (map fn (cdr s)))))

(define (filter fn s)
  (cond ((null? s) nil)
        ((fn (car s)) (cons (car s)
                            (filter fn (cdr s))))
        (else (filter fn (cdr s)))))

; Implementing and using these helper procedures is optional. You are allowed
; to delete them.
(define (count name s)
  (cond ((null? s) 0)
        ((eq? (car s) name) (+ 1 (count name (cdr s))))
        (else (count name (cdr s)))))

(define (tally names)
  (if (null? names) 
    nil
    (cons 
      (cons (car names) (count (car names) names)) 
      (tally (filter (lambda (x) (not (eq? x (car names)))) (cdr names))))))