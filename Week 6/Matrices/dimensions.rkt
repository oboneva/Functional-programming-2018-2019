#lang racket
(require rackunit rackunit/text-ui)

(define (dimensions matrix)
  (cons (length matrix) (length (car matrix))))

(define dimensions-tests
  (test-suite
   "Tests for dimensions"

   (check-equal? (dimensions '((1))) '(1 . 1))
   (check-equal? (dimensions '((1) (2))) '(2 . 1))
   (check-equal? (dimensions '((1 2 3) (4 5 6))) '(2 . 3))
   (check-equal? (dimensions '((1 2 3) (4 5 6) (7 8 9))) '(3 . 3))))

(run-tests dimensions-tests)