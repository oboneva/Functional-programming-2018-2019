#lang racket

(define (juxt . fns)
  (define (f fns args)
    (if (null? fns)
        '()
        (cons (apply (car fns) args) (f (cdr fns) args))))
  (lambda args (f fns args)))
  
  

(define (inc x) (+ x 1))
(define (dec x) (- x 1))
(define (square x) (* x x))
(define (double x) (* 2 x))

(define f (juxt inc dec square double)) ; (f x) = (list (inc x) (dec x) (square x) (double x))
;(f 5) ; => (6 4 25 10)

(define g (juxt + *))
;(g 3 4 5) ; => (12 60)

