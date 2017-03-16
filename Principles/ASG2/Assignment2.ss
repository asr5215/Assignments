#lang racket

(define (consEmpty) '(()))

(define consTree (lambda (parent child1 child2)
  (cond
    ((not(number? parent)) (print "All node values must be numbers"))
    ((and (null? (car child1)) (null? (car child2))) (cons parent (append child1 child2)))
    ((null? (car child1)) (cons parent (append child1 (cons child2 '()))))
    ((null? (car child2)) (cons parent (append (cons child1 '()) child2)))
    (else (cons parent (append (cons child1 '()) (cons child2 '())))))))

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
    ((null? lst) 0)
    (else (+ (car lst) (+ (sum (cadr lst)) (sum (caddr lst))))))))

(define preorder (lambda (lst)
  lst))

(define left (lambda (lst)
  (cadr lst)))

(define right (lambda (lst)
  (caddr lst)))

(define t (consEmpty))
(define t2 (consTree 'd (consTree 15 (consTree 14 t t) t) (consTree 14 t t)))
;(empty? t2)
;(empty? t)
;(sum t2)
;(preorder t2)
;(left t2)
;(right t2)