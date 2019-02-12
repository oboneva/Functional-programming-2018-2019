#lang racket
(require rackunit rackunit/text-ui)

(define (accumulate op nv term a next b)
  (if (> a b)
      nv
      (op (term a) (accumulate op nv term (next a) next b))))

(define (count predicate a b)
  (accumulate
   +
   0
   (lambda (x)
     (if (predicate x)
         1
         0))
   a
   (lambda (a)
     (+ a 1))
   b))

(define (meet-twice? f g a b)
  (>
   (count
    (lambda (x)
      (=
       (f x)
       (g x)))
    a
    b)
   1))

(define meet-twice?-tests
  (test-suite
   "Tests for meet-twice?"

   (check-true (meet-twice? (lambda (x) x) (lambda (x) x) 0 5))
   (check-true (meet-twice? (lambda (x) x) sqrt 0 5))
   (check-false (meet-twice? (lambda (x) x) (lambda (x) x) 42 42))
   (check-false (meet-twice? (lambda (x) x) (lambda (x) (- x)) -3 1))))

(run-tests meet-twice?-tests)