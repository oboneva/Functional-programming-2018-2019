#lang racket
(require rackunit rackunit/text-ui)

(define (drop-while p l)
    (cond ((null? l) l)
          ((p (car l)) (drop-while p (cdr l)))
          (else l)))

(define drop-while-tests
  (test-suite
   "Tests for drop-while"

   (check-equal? (drop-while even? '()) '())
   (check-equal? (drop-while even? '(1)) '(1))
   (check-equal? (drop-while even? '(2)) '())
   (check-equal? (drop-while even? '(2 4 6 1 8 10 11)) '(1 8 10 11))
   (check-equal? (drop-while even? '(1 2 4 6 1 8 10 11)) '(1 2 4 6 1 8 10 11))))

(run-tests drop-while-tests)