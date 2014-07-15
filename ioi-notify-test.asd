#|
  This file is a part of ioi-notify project.
  Copyright (c) 2014 stibear
|#

(in-package :cl-user)
(defpackage ioi-notify-test-asd
  (:use :cl :asdf))
(in-package :ioi-notify-test-asd)

(defsystem ioi-notify-test
  :author "stibear"
  :license ""
  :depends-on (:ioi-notify
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:test-file "ioi-notify"))))

  :defsystem-depends-on (:cl-test-more)
  :perform (test-op :after (op c)
                    (funcall (intern #. (string :run-test-system) :cl-test-more)
                             c)
                    (asdf:clear-system c)))
