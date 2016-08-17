;; file: labels.lisp

(in-package :cl-bootstrap)

(defmacro bs-label ((&key (type "default")) &body body)
  `(with-html-output (*standard-output*)
        (:span :class (format nil "label label-~a" ,type)
            ,@body)))

(defmacro bs-label-primary (&body body)
  `(bs-label (:type "primary") ,@body))

(defmacro bs-label-info (&body body)
  `(bs-label (:type "info") ,@body))

(defmacro bs-label-success (&body body)
  `(bs-label (:type "success") ,@body))

(defmacro bs-label-warning (&body body)
  `(bs-label (:type "warning") ,@body))

(defmacro bs-label-danger (&body body)
  `(bs-label (:type "danger") ,@body))

;; EOF
