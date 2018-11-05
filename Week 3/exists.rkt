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

(define (exists? predicate a b)
  (if (> (count predicate a b) 0)
      #t
      #f))

(define exists?-tests
  (test-suite
   "Tests for exists?"

   (check-true (exists? (lambda (x) (= x 3)) 1 5))
   (check-true (exists? (lambda (x) (< x 0)) -3 9))
   (check-true (exists? (lambda (x) (= 0 (* x 0))) -3 15))

   (check-false (exists? (lambda (x) (= x 13)) 1 5))
   (check-false (exists? (lambda (x) (< x 3)) 10 42))
   (check-false (exists? (lambda (x) (< x 0)) 3 8))
   (check-false (exists? (lambda (x) (= 0 (* x 0))) 2 1))))

(run-tests exists?-tests)