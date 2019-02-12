#lang racket
(require rackunit rackunit/text-ui)

(define left-tree cadr)

(define root car)

(define right-tree caddr)

(define empty? null?)

(define (leaf? t)
  (and (not (empty? t))
       (empty? (left-tree t))
       (empty? (right-tree t))))

(define (count-leaves t)
  (cond ((empty? t) 0)
        ((leaf? t) 1)
        (else (+ (count-leaves (left-tree t))
           (count-leaves (right-tree t))))))

(define count-leaves-tests
  (test-suite
   "Tests for count-leaves"

   (check = (count-leaves '()) 0)
   (check = (count-leaves '(1 () ())) 1)
   (check = (count-leaves '(1 (2 (4 () ()) (5 () ())) (3 () ()))) 3)))

(run-tests count-leaves-tests)