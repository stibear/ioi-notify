#|
  This file is a part of ioi-notify project.
  Copyright (c) 2014 stibear
|#

#|
  Author: stibear
|#

(in-package :cl-user)
(defpackage ioi-notify-asd
  (:use :cl :asdf))
(in-package :ioi-notify-asd)

(defsystem ioi-notify
  :version "0.1"
  :author "stibear"
  :license ""
  :depends-on (:drakma
               :cl-json
               :trivial-shell)
  :components ((:module "src"
                :components
                ((:file "catupper"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op ioi-notify-test))))
