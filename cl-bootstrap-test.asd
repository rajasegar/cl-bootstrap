;; file: cl-bootstrap-test.asd

(asdf:defsystem :cl-bootstrap-test
  :description "Testing system for cl-bootstrap"
  :version "0.0.1"
  :license "MIT"
  :serial t
  :author "Rajasegar Chandran <rajasegar.c@gmail.com>"
  :depends-on (:cl-bootstrap
               :fiveam)
  :components ((:file "cl-bootstrap-test")))
