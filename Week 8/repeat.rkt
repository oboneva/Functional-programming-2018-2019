#lang racket
(require rackunit rackunit/text-ui)

(define head car)

(define (tail s)
  (force (cdr s)))

(define (stream-take n s)
  (if (or (= n 0)
          (null? s))
      '()
      (cons (head s)
            (stream-take (- n 1) (tail s)))))

(define (repeat value)
  (cons value (delay (repeat value))))

(define repeat-tests
  (test-suite
   "Tests for repeat"

   (check-equal? (stream-take 5 (repeat 1)) '(1 1 1 1 1))
   (check-equal? (stream-take 3 (repeat 6)) '(6 6 6))
   (check-equal? (stream-take 6 (repeat '())) '(() () () () () ()))
   (check-equal? (stream-take 3 (repeat '(1 2 3))) '((1 2 3) (1 2 3) (1 2 3)))))

(run-tests repeat-tests)