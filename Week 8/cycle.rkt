#lang racket
(require rackunit rackunit/text-ui)

(define (cycle l)
  (define (generator values)
    (if (null? values)
        (generator l)
        (cons (car values) (delay (generator (cdr values))))))
  (if (null? l)
      '()
      (generator l)))

(define head car)

(define (tail s)
  (force (cdr s)))

(define (stream-take n s)
  (if (or (= n 0)
          (null? s))
      '()
      (cons (head s)
            (stream-take (- n 1) (tail s)))))

(define cycle-tests
  (test-suite
   "Tests for cycle"

   (check-equal? (stream-take 5 (cycle '())) '())
   (check-equal? (stream-take 5 (cycle '(1))) '(1 1 1 1 1))
   (check-equal? (stream-take 3 (cycle '(6))) '(6 6 6))
   (check-equal? (stream-take 2 (cycle '(1 2 3))) '(1 2))
   (check-equal? (stream-take 5 (cycle '(1 2 3))) '(1 2 3 1 2))
   (check-equal? (stream-take 7 (cycle '(1 2 3))) '(1 2 3 1 2 3 1))))

(run-tests cycle-tests)