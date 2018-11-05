#lang racket
(require rackunit rackunit/text-ui)

(define (signum x)
  (cond ((= x 0) 0)
        ((quotient x (abs x)))))

(define signum-tests
  (test-suite
   "Tests for signum"

   (check = (signum 0) 0)
   (check = (signum 1) 1)
   (check = (signum 3) 1)
   (check = (signum -1) -1)
   (check = (signum -3) -1)))

(run-tests signum-tests)