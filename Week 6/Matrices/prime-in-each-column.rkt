#lang racket
(require rackunit rackunit/text-ui)

(define (square x) (* x x))

(define (prime? x)
  (define (count-to n)
    (cond ((= x 1) #f)
          ((= x 2) #t)
          ((> (square n) x) #t)
          ((= (remainder x n) 0) #f)
          (else (count-to (+ n 1)))))
  (count-to 2))

(define (exists? p list)
  (and (not (null? list))
       (or (p (car list))
           (exists? p (cdr list)))))

(define (transpose matrix)
  (apply map list matrix))

(define (every? p lists)
  (or (null? lists)
      (and (p (car lists))
           (every? p (cdr lists)))))

(define (for-all-columns? p matrix)
  (every? p (transpose matrix)))

(define (prime-in-each-column? matrix)
  (for-all-columns? (lambda (l) (exists? prime? l)) matrix))


(define prime-in-each-column?-tests
  (test-suite
   "Tests for prime-in-each-column?"

   (check-false (prime-in-each-column? '((1))))
   (check-true (prime-in-each-column? '((1) (2))))
   (check-false (prime-in-each-column? '((1 2 3))))
   (check-true (prime-in-each-column? '((1 2 3) (2 3 4))))
   (check-true (prime-in-each-column? '((17 2 16) (4 5 3))))
   (check-true (prime-in-each-column? '((1 2 3) (4 5 6) (7 8 9))))
   (check-false (prime-in-each-column? '((1 2 3) (4 5 6) (42 8 9))))))

(run-tests prime-in-each-column?-tests)