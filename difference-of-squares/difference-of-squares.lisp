;; Finds the difference between the square of the sum and the sum of the squares
;; of the first `n` natural numbers.

(defpackage :difference-of-squares
  (:use :cl)
  (:export :sum-of-squares
           :square-of-sum
           :difference))

(in-package :difference-of-squares)

(defun first-natural-numbers (n)
  "Returns the all natural numbers up to a given number."
  ;; Loop from 1 to `n`, adding each `i` to a list
  (loop for i from 1 to n collect i))

(defun sum-natural-numbers (n)
  "Returns the sum of all natural numbers up to a given number."
  ;; Reduce a list of natural numbers with the addition operator, giving a sum
  (reduce #'+ (first-natural-numbers n)))

(defun square-natural-numbers (n)
  "Returns the square of each natural number up to a given number."
  ;; Use `mapcar` to map over the list of natural numbers. Use a lambda function
  ;; which uses `expt` to raise each number to the power of 2 (effectively
  ;; squaring it)
  (mapcar #'(lambda (x) (expt x 2)) (first-natural-numbers n)))

(defun square-of-sum (n)
  "Calculates the square of the sum for a given number."
  ;; Use `expt` to raise the sum to the power of 2, squaring it.
  (expt (sum-natural-numbers n) 2))

(defun sum-of-squares (n)
  "Calculates the sum of squares for a given number."
  ;; Reduce the list of squared natural numbers with the addition operator to
  ;; return a sum.
  (reduce #'+ (square-natural-numbers n)))

(defun difference (n)
  "Finds the diff. between the square of the sum and the sum of the squares."
  ;; Use the subtraction operator to find the difference between the square of
  ;; the sum and the sum of the squares.
  (- (square-of-sum n) (sum-of-squares n)))
