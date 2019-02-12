#lang racket
(require rackunit rackunit/text-ui)

(define (transpose matrix)
  (apply map list matrix))

(define (every? p lists)
  (or (null? lists)
      (and (p (car lists))
           (every? p (cdr lists)))))

(define (for-all-columns? p matrix)
  (every? p (transpose matrix)))

(define (any? p l)
  (and (not (null? l))
       (or (p (car l))
           (any? p (cdr l)))))

(define (odd-exists? l)
  (any? odd? l))

(define for-all-columns?-tests
  (test-suite
   "Tests for for-all-columns?"

   (check-true (for-all-columns? odd-exists? '((1))))
   (check-true (for-all-columns? odd-exists? '((1) (2))))
   (check-false (for-all-columns? odd-exists? '((1 2 3))))
   (check-true (for-all-columns? odd-exists? '((1 2 3) (4 5 6))))
   (check-true (for-all-columns? odd-exists? '((1 2 3) (4 5 6) (7 8 9))))
   (check-false (for-all-columns? odd-exists? '((1 2 3) (4 42 6) (7 8 9))))))

(run-tests for-all-columns?-tests)