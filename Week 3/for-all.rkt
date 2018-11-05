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

(define (for-all? predicate a b)
  (if (= (count predicate a b) (+(- b a) 1))
      #t
      #f))

(define for-all?-tests
  (test-suite
   "Tests for for-all?"

   (check-true (for-all? (lambda (x) (> x 0)) 2 98))
   (check-true (for-all? (lambda (x) (< x 0)) -10 -1))
   (check-true (for-all? (lambda (x) (= 0 (* x 0))) -3 15))
   (check-true (for-all? (lambda (x) (= 0 (* x 1))) 2 1))

   (check-false (for-all? (lambda (x) (= x 3)) 1 5))
   (check-false (for-all? (lambda (x) (= x 13)) 1 5))
   (check-false (for-all? (lambda (x) (< x 3)) -5 42))))

(run-tests for-all?-tests)