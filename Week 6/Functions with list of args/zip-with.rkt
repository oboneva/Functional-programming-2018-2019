#lang racket

(define (zip-two-with fn x y)
  (if (or (null? x) (null? y))
      '()
      (cons (fn (car x) (car y)) (zip-two-with fn (cdr x) (cdr y)))))

;(zip-two-with + '(1 3 5) '(2 4 6)) ; -> (3 7 11)
;(zip-two-with + '(1 3 5) '(2 4 6 8)) ; -> (3 7 11)
