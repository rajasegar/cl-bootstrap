;; file: tables.lisp

(in-package :cl-bootstrap)

(defmacro bs-table (&body body)
  `(with-html-output (*standard-output*)
     (:table :class "table"
	     ,@body)))

(defmacro bs-table-striped (&body body)
  `(with-html-output (*standard-output*)
     (:table :class "table table-striped"
	     ,@body)))

(defmacro bs-table-bordered (&body body)
  `(with-html-output (*standard-output*)
     (:table :class "table table-bordered"
	     ,@body)))

(defmacro bs-table-hover (&body body)
  `(with-html-output (*standard-output*)
     (:table :class "table table-hover"
	     ,@body)))

(defmacro bs-table-condensed (&body body)
  `(with-html-output (*standard-output*)
     (:table :class "table table-condensed"
	     ,@body)))


;; EOF
