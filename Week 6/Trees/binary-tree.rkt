#lang racket

(define left-tree car)

(define root cadr)

(define right-tree caddr)

(define empty? null?)

(define (make-tree left root right)
  (list left root right))

(define (leaf x)
  (make-tree '() x '()))

(define (leaf? x)
  (and (empty? (left-tree x))
       (empty? (right-tree x))))

(define (tree? x)
  (or (leaf? x)
      (and (tree? (left-tree x))
           (tree? (right-tree x)))))



