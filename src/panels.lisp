;; file: panels.lisp

(in-package :cl-bootstrap)

(defmacro bs-panel ((&key (type "primary")) &body body)
  "Panel generic"
  `(with-html-output (*standard-output*)
        (:div :class (format nil "panel panel-~a" ,type)
            (:div :class "panel-heading"
                (:h3 :class "panel-title" "Panel Title"))
            (:div :class "panel-body"
                ,@body))))

(defmacro bs-panel-primary (&body body)
  "Primary panel"
  `(bs-panel () ,@body))

(defmacro bs-panel-info (&body body)
  "Info panel"
  `(bs-panel (:type "info") ,@body))


(defmacro bs-panel-success (&body body)
  "Success panel"
  `(bs-panel (:type "success") ,@body))

(defmacro bs-panel-danger (&body body)
  "Danger panel"
  `(bs-panel (:type "danger") ,@body))

(defmacro bs-panel-warning (&body body)
  "Warning panel"
  `(bs-panel (:type "warning") ,@body))


;; EOF
