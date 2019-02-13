#lang racket

(define (search p l)
  (and (not (null? l))
       (or (p (car l))
           (search p (cdr l)))))
(define (make-alist fn keys) (map (lambda (key) (cons key (fn key)) keys)))
(define (keys alist) (map car alist))
(define (values alist) (map cdr alist))
(define (assoc key alist) (search (lambda (pair) (equal? key (car pair))) alist))

(define (add-assoc key value alist)
  (cons (cons key value) (del-assoc key alist)))

(define (del-assoc key alist)
  (filter (lambda (pair) (not (equal? key (car pair)))) alist))

(define empty-graph '())

(define (make-graph vs)
  (make-alist (lambda (x) '()) vs))

(define vertices keys)

(define (children v g)
  (cdr (assoc v g)))

(define (edge? u v g)
  (member v (children u g)))

(define (map-children v fn g)
  (map fn (children v g)))

(define (search-children v p g)
  (search p (children v g)))

(define (add-vertex v g)
  (if (assoc v g)
      g
      (add-assoc v '() g)))

(define (remove-vertex v g)
  (map (lambda (pair) (remove v (cdr pair) (del-assoc v g)))))
