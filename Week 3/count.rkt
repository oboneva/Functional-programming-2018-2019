#lang racket
(require rackunit rackunit/text-ui)

(define (accumulate operation zero term start next end)
  (if (> start end)
      zero
      (operation (term start) (accumulate operation zero term (next start) next end))))

(define (count predicate a b)
  (define (predicateToNum x)
    (if (predicate x)
        1
        0))
  (accumulate + 0 predicateToNum a (lambda (x) (+ x 1)) b))

(define count-tests
  (test-suite
   "Tests for count"

   (check = (count even? 1 5) 2)
   (check = (count even? 0 10) 6)

   (check = (count odd? 1 5) 3)
   (check = (count odd? 0 10) 5)))

(run-tests count-tests)