#lang racket

(define (search p l)
  (and (not (null? l))
       (or (p (car l))
           (search p (cdr l)))))

(define (make-alist fn keys)
  (map (lambda (key) (cons key (fn key)) keys)))

(define (keys alist)
  (map car alist))

(define (values alist)
  (map cdr alist))

(define (assoc key alist)
  (search (lambda (pair) (equal? key (car pair))) alist))

(define (del-assoc key alist)
  (filter (lambda (pair) (not (equal? key (car pair)))) alist))

(define (add-assoc key value alist)
  (cons (cons key value) (del-assoc key alist)))