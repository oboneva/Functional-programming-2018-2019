#lang racket
(require rackunit rackunit/text-ui)

(define (square x) (* x x))

(define (count-divisors x)
  (define (count-to n)
    (cond ((= 1 x) 1)
          ((> (square n) x) 0)
          ((= (remainder x n) 0)(+ 2 (count-to (+ n 1))))
          (else (count-to (+ n 1)))))
  (count-to 1))

(define (count-divisors-iter x)
  (define (iter result n)
    (cond ((= x 1) 1)
          ((> (square n) x) result)
          ((= (remainder x n) 0) (iter (+ 2 result) (+ n 1)))
          (else (iter result (+ n 1)))))
  (iter 0 1))

(define count-divisors-iter-tests
  (test-suite
   "Tests for count-divisors-iter"

   (check = (count-divisors-iter 1) 1)
   (check = (count-divisors-iter 3) 2)
   (check = (count-divisors-iter 12) 6)
   (check = (count-divisors-iter 15) 4)
   (check = (count-divisors-iter 19) 2)
   (check = (count-divisors-iter 42) 8)
   (check = (count-divisors-iter 661) 2)
   (check = (count-divisors-iter 666) 12)
   (check = (count-divisors-iter 1337) 4)
   (check = (count-divisors-iter 65515) 4)
   (check = (count-divisors-iter 1234567) 4)))

(define count-divisors-tests
  (test-suite
   "Tests for count-divisors"

   (check = (count-divisors 1) 1)
   (check = (count-divisors 3) 2)
   (check = (count-divisors 12) 6)
   (check = (count-divisors 15) 4)
   (check = (count-divisors 19) 2)
   (check = (count-divisors 42) 8)
   (check = (count-divisors 661) 2)
   (check = (count-divisors 666) 12)
   (check = (count-divisors 1337) 4)
   (check = (count-divisors 65515) 4)
   (check = (count-divisors 1234567) 4)))

(run-tests count-divisors-iter-tests)

(run-tests count-divisors-tests)