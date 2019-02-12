#lang racket
(require rackunit rackunit/text-ui)


(define (make-tree left root right)
  (list root left right))

(define left-tree cadr)

(define root car)

(define right-tree caddr)

(define empty? null?)

(define (leaf? t)
  (and (not (empty? t))
       (empty? (left-tree t))
       (empty? (right-tree t))))

(define (map-tree fn t)
  (if (empty? t)
      '()
      (make-tree (map-tree fn (left-tree t))
                         (fn (root t))
                         (map-tree fn (right-tree t)))))

(define (square x) (* x x))
(define (cube x) (* x x x))

(define map-tree-tests
  (test-suite
   "Tests for map-tree"

   (check-equal? (map-tree square '()) '())
   (check-equal? (map-tree square '(4 () ())) '(16 () ()))
   (check-equal? (map-tree square '(1 (2 (4 () ()) (5 () ())) (3 () ())))
                 '(1 (4 (16 () ()) (25 () ())) (9 () ())))
   (check-equal? (map-tree cube '(1 (2 (4 () ()) (5 () ())) (3 () ())))
                 '(1 (8 (64 () ()) (125 () ())) (27 () ())))))

(run-tests map-tree-tests)