#lang racket
(require rackunit rackunit/text-ui)

(define m '((1 2 3) (4 5 6) (7 8 9)))

(define (transpose matrix)
  (if (= (length (car matrix)) 1)
      (list(map car matrix))
      (append (list (map car matrix)) (transpose (map cdr matrix)))))

(define transpose-tests
  (test-suite
   "Tests for transpose"

   (check-equal? (transpose '((1))) '((1)))
   (check-equal? (transpose '((1) (2))) '((1 2)))
   (check-equal? (transpose '((1 2 3))) '((1) (2) (3)))
   (check-equal? (transpose '((1 2 3) (4 5 6))) '((1 4) (2 5) (3 6)))
   (check-equal? (transpose '((1 2 3) (4 5 6) (7 8 9)))
                 '((1 4 7) (2 5 8) (3 6 9)))))

(run-tests transpose-tests)