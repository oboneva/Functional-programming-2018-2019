#lang racket
(require rackunit rackunit/text-ui)

(define (fibonacci n)
  (if (< n 2)
      n
      (+ (fibonacci (- n 1)) (fibonacci (- n 2)))))

(define (fibonacci-iter n)
  (define (iter current prev n)
    (if (< n 1)
        (+ n prev)
        (iter (+ current prev) current (- n 1))))
  (iter 1 0 n))

(define fibonacci-tests
  (test-suite
   "Tests for fibonacci"

   (check = (fibonacci 0) 0)
   (check = (fibonacci 1) 1)
   (check = (fibonacci 2) 1)
   (check = (fibonacci 3) 2)
   (check = (fibonacci 4) 3)
   (check = (fibonacci 5) 5)
   (check = (fibonacci 6) 8)
   (check = (fibonacci 7) 13)
(check = (fibonacci 20) 6765)))

(define fibonacci-iter-tests
  (test-suite
   "Tests for fibonacci-iter"

   (check = (fibonacci-iter 0) 0)
   (check = (fibonacci-iter 1) 1)
   (check = (fibonacci-iter 2) 1)
   (check = (fibonacci-iter 3) 2)
   (check = (fibonacci-iter 4) 3)
   (check = (fibonacci-iter 5) 5)
   (check = (fibonacci-iter 6) 8)
   (check = (fibonacci-iter 7) 13)
   (check = (fibonacci-iter 20) 6765)))

(run-tests fibonacci-tests)

(run-tests fibonacci-iter-tests)