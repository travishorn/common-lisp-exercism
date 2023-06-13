;; Given a year, report if it is a leap year.
;; A leap year occurs on every year that is evenly divisible by 4,
;; except every year that is divisible by 100,
;; unless the year is also evenly divisible by 400.

(defpackage :leap
  (:use :cl)
  (:export :leap-year-p))
(in-package :leap)

;; Define a function called `leap-year-p` which takes one argument
(defun leap-year-p (year)
  ;; This has to be true AND one of the following has to be true
  ;; Use `zerop` to check if a number is 0
  ;; Use `mod` to get the modulus (remainder after division) of the given year
  ;; divided by 4. If the year is evenly divisible by 4, the modulus is 0, and
  ;; `zerop` is `true`.
  (and (zerop (mod year 4))
    ;; If the above is true, this must be true OR the following line must be
    ;; true. Use `not` to invert the return value. Use `zerop` to check if a
    ;; number is 0. Use `mod` to get the remainder of the year divided by 100.
    ;; Returns `true` if the year is not evently divisible by 100.
    (or (not (zerop (mod year 100)))
      ;; Use `zerop` and `mod` to return `true` if the year is evently divisible
      ;; by 400.
      (zerop (mod year 400)))))
