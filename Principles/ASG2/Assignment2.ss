#lang racket

(define-namespace-anchor a)
(define ns (namespace-anchor->namespace a))

(define consEmpty
  (lambda ()
    (lambda (function)
      (cond
        ((eqv? function 'right) '())
        ((eqv? function 'left) '())
        ((eqv? function 'empty?) #t)
        ((eqv? function 'preorder) '())
        ((eqv? function 'postorder) '())
        ((eqv? function 'sum) 0)
        (else function)))))

(define consTree
  (lambda (parent left right)
    (lambda (function)
      (cond
        ((eqv? function 'sum) (+ parent (+ (left function) (right function))))
        ((eqv? function 'empty?) #f)
        ((eqv? function 'left) left)
        ((eqv? function 'right) right)
        ((eqv? function 'preorder) (cons parent (list (left function) (right function))))
        ((eqv? function 'postorder) (cons (left function) (list (right function) parent)))
        (else function)))))

;(define consTree (lambda (parent child1 child2)
;  (cond
;    ((not(number? parent)) (print "All node values must be numbers"))
;    ((and (null? (car child1)) (null? (car child2))) (cons parent (append child1 child2)))
;    ((null? (car child1)) (cons parent (append child1 (cons child2 '()))))
;    ((null? (car child2)) (cons parent (append (cons child1 '()) child2)))
;    (else (cons parent (append (cons child1 '()) (cons child2 '())))))))

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
(define t2 (consTree 10 (consTree 15 t t) t))
(t2 'empty?)
(t 'empty?)
(t2 'sum)
(t2 'preorder)
((t2 'left) 'preorder)
((t2 'right)'preorder)
(define t3 (consTree 7 t2 t2))
(define t4 (consTree 7 t3 t3))
(t3 'preorder)
(((t3 'right) 'left) 'preorder)
(t4 'preorder)
(((t4 'right) 'left) 'preorder)
(t3 'sum)
((t3 'left) 'preorder)
((t3 'right)'preorder)
(t4 'sum)
((t4 'left) 'preorder)
((t4 'right)'preorder)