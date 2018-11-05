#lang racket
(require rackunit rackunit/text-ui)

(define (count-digits n)
  (if (< n 10)
      1
      (+ 1 (count-digits (quotient n 10)))))

(define (reverse-digits n)
  (if (< n 10)
      n
      (+ (* (remainder n 10)
            (expt 10 (- (count-digits n) 1)))
         (reverse-digits (quotient n 10)))))

(define (accumulate operation zero term start next end)
  (if (> start end)
      zero
      (operation (term start) (accumulate operation zero term (next start) next end))))

(define (count predicate a b)
  (define (predicateToNum x)
    (if (predicate x)
        1
        0))
  (accumulate + 0 predicateToNum a (lambda (x) (+ x 1)) b))

(define (palindrome? n)
  (= n (reverse-digits n)))

(define (count-palindromes a b)
  (count palindrome? a b))

(define count-palindromes-tests
  (test-suite
   "Tests for count-palindromes"

   (check = (count-palindromes 1 5) 5)
   (check = (count-palindromes 0 10) 10)
   (check = (count-palindromes 11 100) 9)
   (check = (count-palindromes 101 1000) 90)))

(run-tests count-palindromes-tests)