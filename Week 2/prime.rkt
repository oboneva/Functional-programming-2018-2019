#lang racket
(require rackunit rackunit/text-ui)

(define (square x) (* x x))

(define (prime? x)
  (define (count-to n)
    (cond ((= x 1) #f)
          ((= x 2) #t)
          ((> (square n) x) #t)
          ((= (remainder x n) 0) #f)
          (else (count-to (+ n 1)))))
  (count-to 2))

(define prime?-tests
  (test-suite
   "Tests for prime?"

   (check-true (prime? 3))
   (check-true (prime? 19))
   (check-true (prime? 599))
   (check-true (prime? 661))
   (check-true (prime? 2221))
   (check-true (prime? 7879))

   (check-false (prime? 1))
   (check-false (prime? 12))
   (check-false (prime? 15))
   (check-false (prime? 42))
   (check-false (prime? 666))
   (check-false (prime? 1337))
   (check-false (prime? 65515))
   (check-false (prime? 1234567))))

(run-tests prime?-tests)