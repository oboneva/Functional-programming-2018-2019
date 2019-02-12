#lang racket

(define (flip . fn)
  (lambda args (reverse args)))

(define list^ (flip list))
(list^ 1 2 3) ; -> (3 2 1)