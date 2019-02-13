#lang racket
(require rackunit rackunit/text-ui)

(define (iterate f x)
  (cons x (delay (iterate f (f x)))))

(define head car)

(define (tail s)
  (force (cdr s)))

(define (stream-take n s)
  (if (or (= n 0)
          (null? s))
      '()
      (cons (head s)
            (stream-take (- n 1) (tail s)))))

(define (square x) (* x x))

(define iterate-tests
  (test-suite
   "Tests for iterate"

   (check-equal? (stream-take 5 (iterate identity 42)) '(42 42 42 42 42))
   (check-equal? (stream-take 4 (iterate square 2)) '(2 4 16 256))
   (check-equal? (stream-take 3 (iterate list 6)) '(6 (6) ((6))))
   (check-equal? (stream-take 6 (iterate list '()))
                 '(() (()) ((())) (((()))) ((((())))) (((((())))))))))

(run-tests iterate-tests)