#lang racket
(require rackunit rackunit/text-ui)

(define (take-while p l)
  (define (iter result l)
    (cond ((null? l) result)
          ((not (p (car l))) result)
          (else (iter (cons (car l) result) (cdr l)))))
  (reverse (iter '() l)))

(define take-while-tests
  (test-suite
   "Tests for take-while"

   (check-equal? (take-while even? '()) '())
   (check-equal? (take-while even? '(1)) '())
   (check-equal? (take-while even? '(2)) '(2))
   (check-equal? (take-while even? '(2 4 6 1 8 10 11)) '(2 4 6))
   (check-equal? (take-while even? '(1 2 4 6 1 8 10 11)) '())))

(run-tests take-while-tests)