;; file: buttons.lisp

(in-package :cl-bootstrap)

(defmacro bs-btn ((&key (type "default")) &body body)
  "Default button"
  `(with-html-output (*standard-output*)
        (:button :type "button" :class (format nil "btn btn-~a" ,type)
            ,@body)))

(defmacro bs-btn-primary (&body body)
  `(bs-btn (:type "primary") ,@body))

(defmacro bs-btn-success (&body body)
  `(bs-btn (:type "success") ,@body))

(defmacro bs-btn-info (&body body)
  `(bs-btn (:type "info") ,@body))

(defmacro bs-btn-warning (&body body)
  `(bs-btn (:type "warning") ,@body))

(defmacro bs-btn-danger (&body body)
  `(bs-btn (:type "danger") ,@body))


;; EOF
