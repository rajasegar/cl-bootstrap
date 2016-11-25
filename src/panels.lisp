;; file: panels.lisp

(in-package :cl-bootstrap)

(defmacro bs-panel ((&key (type "primary") (title "")) &body body)
  "Panel generic"
  `(with-html-output (*standard-output*)
        (:div :class (format nil "panel panel-~a" ,type)
            (:div :class "panel-heading"
                (:h3 :class "panel-title" ,title))
            (:div :class "panel-body"
                ,@body))))

(defmacro bs-panel-primary ((&key (title "")) &body body)
  "Primary panel"
  `(bs-panel (:title ,title) ,@body))

(defmacro bs-panel-info ((&key (title "")) &body body)
  "Info panel"
  `(bs-panel (:type "info" :title ,title) ,@body))


(defmacro bs-panel-success ((&key (title "")) &body body)
  "Success panel"
  `(bs-panel (:type "success" :title ,title) ,@body))

(defmacro bs-panel-danger ((&key (title "")) &body body)
  "Danger panel"
  `(bs-panel (:type "danger" :title ,title) ,@body))

(defmacro bs-panel-warning ((&key (title "")) &body body)
  "Warning panel"
  `(bs-panel (:type "warning" :title ,title) ,@body))


;; EOF
