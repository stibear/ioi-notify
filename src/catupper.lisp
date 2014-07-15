#|
  This file is a part of ioi-notify project.
  Copyright (c) 2014 stibear
|#

(in-package :cl-user)
(defpackage ioi-notify
  (:use :cl)
  (:export #:main))
(in-package :ioi-notify)

(setf drakma:*drakma-default-external-format* :utf-8)

(pushnew '("application" . "json")
         drakma:*text-content-types* :test #'equal)

(defun get-score ()
  (cdr (assoc
        :+jpn2+
        (json:decode-json-from-string
         (drakma:http-request "http://live.ioi2014.org/scores")))))


(defun score-print (score &optional dest)
  (format
   dest
   "~A"
   (with-output-to-string (str)
     (mapc
      (lambda (alst)
        (format str "~A: ~A~%" (car alst) (cdr alst)))
      score))))

(defun main ()
  (let ((state (score-print (get-score))))
    (loop
       (sleep 10)
       (let ((new (get-score)))
         (unless (tree-equal state new)
           (metashell:shell-command
            (format nil "notify-send '~A'" (score-print new)))
           (setf state new))))))

