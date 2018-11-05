#lang racket
(require rackunit rackunit/text-ui)

(define (reverse1 l)
  (if (null? l)
      l
      (append (reverse1 (cdr l)) (cons (car l) '()))))

(define (reverse l)
  (define (reverse-iter result l)
    (if (null? l)
        result
        (reverse-iter (cons (car l) result) (cdr l))))
  (reverse-iter '() l))

(define reverse-tests
  (test-suite
   "Tests for reverse"

   (check-equal? (reverse '()) '())
   (check-equal? (reverse '(42)) '(42))
   (check-equal? (reverse '(1 2)) '(2 1))
   (check-equal? (reverse '(1 2 3 4 5 6)) '(6 5 4 3 2 1))
   (check-equal? (reverse '(4 3 3 2 5 2)) '(2 5 2 3 3 4))
   (check-equal? (reverse '(1 2 3 2 1)) '(1 2 3 2 1))))

(run-tests reverse-tests)