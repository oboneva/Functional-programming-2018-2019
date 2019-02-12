#lang racket
(require rackunit rackunit/text-ui)

(define (nth-row matrix n)
  (list-ref matrix n))

(define (main-diagonal matrix)
  (define (f index result)
    (if (<= (length matrix) index)
        result
        (f (+ index 1) (append result (list(list-ref (nth-row matrix index) index))))))
  (f 0 '()))

(define main-diagonal-tests
  (test-suite
   "Tests for main-diagonal"

   (check-equal? (main-diagonal '((1))) '(1))
   (check-equal? (main-diagonal '((1 2) (3 4))) '(1 4))
   (check-equal? (main-diagonal '((1 2 3) (4 5 6) (7 8 9))) '(1 5 9))))

(run-tests main-diagonal-tests)