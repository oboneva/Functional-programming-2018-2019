#lang racket
(require rackunit rackunit/text-ui)

(define left-tree cadr)

(define root car)

(define right-tree caddr)

(define empty? null?)

(define (level n t)
  (if (empty? t)
      '()
      (if (= n 0)
          (list (root t))
          (append (level (- n 1) (left-tree t)) (level (- n 1) (right-tree t))))))

(define level-tests
  (test-suite
   "Tests for level"

   (check-equal? (level 0 '(1 (2 (4 () ()) (5 () ())) (3 () ()))) '(1))
   (check-equal? (level 1 '(1 (2 (4 () ()) (5 () ())) (3 () ()))) '(2 3))
   (check-equal? (level 2 '(1 (2 (4 () ()) (5 () ())) (3 () ()))) '(4 5))))

(run-tests level-tests)