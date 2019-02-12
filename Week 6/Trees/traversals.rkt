#lang racket
(require rackunit rackunit/text-ui)

(define left-tree cadr)

(define root car)

(define right-tree caddr)

(define empty? null?)

(define (pre-order t)
  (if (empty? t)
      '()
      (append (list (root t) ) (pre-order (left-tree t)) (pre-order (right-tree t)))))

(define (in-order t)
  (if (empty? t)
      '()
      (append (in-order (left-tree t)) (list (root t)) (in-order (right-tree t)))))

(define (post-order t)
  (if (empty? t)
      '()
      (append (post-order (left-tree t)) (post-order (right-tree t)) (list (root t)))))


(define traversals-tests
  (test-suite
   "Tests for traversals"

   (check-equal? (pre-order '(1 (2 (4 () ()) (5 () ())) (3 () ())))
                 '(1 2 4 5 3))
   (check-equal? (in-order '(1 (2 (4 () ()) (5 () ())) (3 () ()))) '(4 2 5 1 3))
   (check-equal? (post-order '(1 (2 (4 () ()) (5 () ())) (3 () ())))
                 '(4 5 2 3 1))))

(run-tests traversals-tests)