;; Given a string, verify that any and all pairs of brackets are matched and
;; nested correctly.

(defpackage :matching-brackets
  (:use :cl)
  (:export :pairedp))

(in-package :matching-brackets)

;; Define a global parameter that describes the opening brackets [, (, and {.
(defparameter *opening* '(#\[ #\( #\{))

;; Define a global parameter that describes the closing brackets ], ), and }.
(defparameter *closing* '(#\] #\) #\}))

;; Define a function which uses a stack data structure to verify matched pairs.
(defun pairedp (value)
  ;; Initialize the stack
  (let (stack)
    ;; Loop over all characters in the input string
    (loop for c across value
      ;; When the character is an opening bracket...
      when (member c *opening*)
        ;; Push the opening bracket into the stack
        do (push c stack)
      ;; When the character is a closing bracket...
      when (member c *closing*)
        ;; Get the position of the character in the list of closing brackets
        do (let* ((pos (position c *closing*))
          ;; Get the expected matching opening bracket based on that position
          (expected (nth pos *opening*))
          ;; Get and remove the first item in the stack
          (actual (pop stack)))
        ;; Is the first item in the stack the matching bracket to the current
        ;; closing bracket?
        (unless (eql actual expected)
          ;; No, return nil because pairs are not matched
          (return nil)))
          ;; We reached the end of the stack. It is now empty, meaning all
          ;; brackets have been correctly matched. Returns true.
          finally (return (null stack)))))
