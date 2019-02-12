#lang racket
(require rackunit rackunit/text-ui)

(define (digits-count x)
  (if (< x 10)
      1
      (+ 1 (digits-count (quotient x 10)))))

(define (nth-digit number n)
  (cond ((= n 0) (remainder number 10))
        (else (nth-digit (quotient number 10) (- n 1)))))

(define (middle-digit x)
  (if (= (remainder (digits-count x) 2) 0)
      -1
      (nth-digit x (quotient (digits-count x) 2))))


(define middle-digit-tests
  (test-suite
   "Tests for middle-digit"

   (check = (middle-digit 0) 0)
   (check = (middle-digit 1) 1)
   (check = (middle-digit 42) -1)
   (check = (middle-digit 452) 5)
   (check = (middle-digit 4712) -1)
   (check = (middle-digit 47124) 1)
   (check = (middle-digit 1892364) 2)
   (check = (middle-digit 38912734) -1)
   ))

(run-tests middle-digit-tests)