;; `twofer` takes an optional argument `name`. If no name is given or the name
;; is `nil`, it returns "One for you, one for me." Otherwise, it returns "One
;; for *name*, one for me."

(defpackage :two-fer
  (:use :cl)
  (:export :twofer))
(in-package :two-fer)

;; Define a function called `twofer` which takes an optional argument `name`
(defun twofer (&optional name)
  ;; If name exists and it is not `nil`...
  (if name
    ;; Return a string with the name interpolated
    (format nil "One for ~A, one for me." name)
    ;; Return a static string
    "One for you, one for me."))
