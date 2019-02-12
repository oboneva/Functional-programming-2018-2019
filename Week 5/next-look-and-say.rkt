#lang racket

(require rackunit rackunit/text-ui)

(define (repeated x l)
  (if (null? l)
       0
       (if (= (car l) x)
           (+ 1 (repeated x (cdr l)))
           0)))

(define (shrink l x)
  (if (null? l)
      l
      (if (not (= (car l) x))
          l
          (shrink (cdr l) x))))

(define (next-look-and-say y)
  (if (null? y)
      y
      (append (list (repeated (car y) y) (car y)) (next-look-and-say (shrink y (car y))))))

(define next-look-and-say-tests
  (test-suite
   "Tests for next-look-and-say"

   (check-equal? (next-look-and-say '()) '())
   (check-equal? (next-look-and-say '(1)) '(1 1))
   (check-equal? (next-look-and-say '(1 1 2 3 3)) '(2 1 1 2 2 3))
   (check-equal? (next-look-and-say '(1 1 2 2 3 3 3 3)) '(2 1 2 2 4 3))))

(run-tests next-look-and-say-tests)