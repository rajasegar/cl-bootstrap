(in-package :cl-user)

(defpackage :cl-bootstrap-test
  (:use :cl :cl-bootstrap :fiveam))

(in-package :cl-bootstrap-test)

(test sanity
      (is (= 4 (+ 2 2)))
      (is (= 2 (+ 1 1)))
      (is (= 3 (- 5 1))))
