#lang racket

(define (consEmpty) '(()))

(define consTree (lambda (parent child1 child2)
  (cons (cons parent (append child1 child2)) '())))

;(define consTree (lambda (parent child1 child2)
;  (cond
;    ((and (null? child1) (null? child2)) (append (list parent) (append child1 child2)))
;    ((null? child1) (append (list parent) (append child1 (consTree (car child2)))))
;    ((null? child2) (append (list parent) (append (consTree (car child1)) (child2))))
;    (else (append (list parent) (append (consTree (car child1)) (consTree (car child2))))))))

(define empty? (lambda (lst)
  (null? (car lst))))

(define sum (lambda (lst)
  (cond
    ((null? (car lst)) 0)
    (else (+ (caar lst) (+ (sum (cdar lst)) (sum (cddar lst))))))))

(define preorder (lambda (lst)
  (car lst)))

(define left (lambda (lst)
  (cadar lst)))

(define right (lambda (lst)
  (caddar lst)))

(define t (consEmpty))
(define t2 (consTree 10 (consTree 15 t t) t))
(empty? t2)
(empty? t)
(sum t2)
(preorder t2)
(left t2)
(right t2)