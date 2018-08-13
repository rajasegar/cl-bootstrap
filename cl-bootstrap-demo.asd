;; file: cl-bootstrap.asd

(defparameter *cl-bootstrap-version* "0.0.2")

(asdf:defsystem :cl-bootstrap-demo
    :description "Twitter Bootstrap widget library for Common Lisp"
    :version #.*cl-bootstrap-version*
    :license "MIT"
    :serial t
    :author "Rajasegar Chandran <rajasegar.c@gmail.com>"
    :depends-on (:cl-who
                 :hunchentoot
                 :parenscript
                 :cl-bootstrap)
    :components
  ((:module :demo
	    :components
            ((:file "demo")))))