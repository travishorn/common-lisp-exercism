;; Functions for create a "robot" structure. We can build a new robot, get the
;; robot name, and reset the name to something else. Robot names are 2 random
;; uppercase letters, followed by a random 3 digit number.

(defpackage :robot-name
  (:use :cl)
  (:export :build-robot :robot-name :reset-name))

(in-package :robot-name)

;; Define a struct named `robot`. It has one slot named `name`.
(defstruct robot
  name)

(defun random-letter ()
  "Returns a random uppercase letter."
  ;; Define the alphabet. All 26 English letters, uppercase
  (let ((alphabet "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
    ;; Get the length of the alphabet, then get a random number up to that
    ;; length, then get the character in the alphabet at that index, then
    ;; convert it to a string
    (string (char alphabet (random (length alphabet))))))

(defun generate-robot-name ()
  "Returns a random 5-character name for a robot."
  ;; Concatenate two random letters and a random 3 digit number
  (concatenate 'string
    (random-letter)
    (random-letter)
    ;; Get a random number up to 1000, make sure it's 3 digits long, and pad it
    ;; with zeroes
    (format nil "~3,'0d" (random 1000))))

(defun build-robot ()
  "Makes a new robot."
  ;; Make a new instance of the `robot` struct with a `name` generated by
  ;; `generate-robot-name`
  (make-robot :name (generate-robot-name)))

(defun robot-name (robot)
  "Gets the name of the given robot."
  (robot-name robot))

(defun reset-name (robot)
  "Sets a new name for the given robot, deleting the old one."
  ;; Use `setf` to change the value of the `robot-name` to a newly generated
  ;; robot name
  (setf (robot-name robot) (generate-robot-name)))
