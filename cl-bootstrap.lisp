;; file: cl-bootstrap.lisp

(in-package :cl-bootstrap)

(defmacro bs-container ((&key (fluid nil)) &body body)
  "Bootstrap Grid Container. Set :fluid t for fluid layout."
  `(with-html-output (*standard-output*)
        (:div :class ,(if fluid "container-fluid" "container")
            ,@body)))

(defmacro bs-row (&body body)
  "Use rows to create horizontal groups of columns."
  `(with-html-output (*standard-output*)
        (:div :class "row"
            ,@body)))

(defmacro bs-col-md ((&key (grid 12) (offset 0)) &body body)
  "Medium  device grid columns >= 992 px"
  `(with-html-output (*standard-output*)
        (:div :class (format nil "col-md-~d col-md-offset-~d" ,grid ,offset)
            ,@body)))

(defmacro bs-col-xs ((&key (grid 12) (offset 0)) &body body)
  "Extra small device grid columns, Phones < 768 px"
  `(with-html-output (*standard-output*)
        (:div :class (format nil "col-xs-~d col-xs-offset-~d" ,grid ,offset)
            ,@body)))

(defmacro bs-col-sm ((&key (grid 12) (offset 0)) &body body)
  "Small device grid columns, Tablets >= 768 px"
  `(with-html-output (*standard-output*)
        (:div :class (format nil "col-sm-~d col-sm-offset-~d" ,grid ,offset)
            ,@body)))

(defmacro bs-col-lg ((&key (grid 12) (offset 0)) &body body)
  "Large devices , Desktops >= 1200 px"
  `(with-html-output (*standard-output*)
        (:div :class (format nil "col-lg-~d col-lg-offset-~d" ,grid ,offset)
            ,@body)))

(defmacro bs-icon ((&key (glyph "asterisk")))
  "Glyphicon from bootstrap"
  `(with-html-output (*standard-output*)
        (:span :class (format nil "glyphicon glyphicon-~a" ,glyph))))

(defmacro bs-well (&body body)
  "bootstrap well"
  `(with-html-output (*standard-output*)
        (:div :class "well"
            ,@body)))

; EOF

