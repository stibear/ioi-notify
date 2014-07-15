(asdf:require-system "ioi-notify")

(sb-ext:save-lisp-and-die
 "catupper-score"
 :executable t
 :toplevel #'ioi-notify:main)
