#lang racket

(define (zip x y)
  (if (or (null? (cdr x)) (null? (cdr y)))
      (list (car x) (car y))
      (list (list (car x) (car y))
            (zip (cdr x) (cdr y)))))

(zip '(1 3 5) '(2 4 6)) ; -> ((1 2) (3 4) (5 6))
(zip '(1 3 5) '(2 4 6 8)) ; -> ((1 2) (3 4) (5 6))