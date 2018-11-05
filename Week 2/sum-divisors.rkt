#lang racket
(require rackunit rackunit/text-ui)

(define (square x) (* x x))

(define (sum-divisors x)
  (define (sum-to n)
    (cond ((= 1 x) 1)
          ((> (square n) x) 0)
          ((= (remainder x n) 0)(+ n (quotient x n) (sum-to (+ n 1))))
          (else (sum-to (+ n 1)))))
  (sum-to 1))

(define (sum-divisors-iter x)
  (define (iter result n)
    (cond ((= 1 x) 1)
          ((> (square n) x) result)
          ((= (remainder x n) 0)(iter (+ n (quotient x n) result) (+ n 1)))
          (else (iter result (+ n 1)))))
  (iter 0 1))

(define sum-divisors-tests
  (test-suite
   "Tests for sum-divisors"

   (check = (sum-divisors 1) 1)
   (check = (sum-divisors 3) 4)
   (check = (sum-divisors 12) 28)
   (check = (sum-divisors 15) 24)
   (check = (sum-divisors 19) 20)
   (check = (sum-divisors 42) 96)
   (check = (sum-divisors 661) 662)
   (check = (sum-divisors 666) 1482)
   (check = (sum-divisors 1337) 1536)
   (check = (sum-divisors 65515) 78624)
   (check = (sum-divisors 1234567) 1244416)))

(define sum-divisors-iter-tests
  (test-suite
   "Tests for sum-divisors-iter"

   (check = (sum-divisors-iter 1) 1)
   (check = (sum-divisors-iter 3) 4)
   (check = (sum-divisors-iter 12) 28)
   (check = (sum-divisors-iter 15) 24)
   (check = (sum-divisors-iter 19) 20)
   (check = (sum-divisors-iter 42) 96)
   (check = (sum-divisors-iter 661) 662)
   (check = (sum-divisors-iter 666) 1482)
   (check = (sum-divisors-iter 1337) 1536)
   (check = (sum-divisors-iter 65515) 78624)
   (check = (sum-divisors-iter 1234567) 1244416)))

(run-tests sum-divisors-tests)

(run-tests sum-divisors-iter-tests)