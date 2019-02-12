#lang racket

(define (compose-two f g)
  (lambda (x) (f (g x))))

(define (compose . fns)
   (define (iter composition functions)
     (if (null? functions)
         composition
         (iter (compose-two composition (car functions)) (cdr functions))))
  (iter id fns))

(define id (lambda (x) x))
(define (double x) (* 2 x))
(define (square x) (* x x))
(define (inc x) (+ x 1))

(define f (compose double square inc)) ; 2 * (x + 1)^2
;(f 3) ; -> 32
;(f 4) ; -> 50