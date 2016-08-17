
;; file: alerts.lisp

(in-package :cl-bootstrap)

(defmacro bs-alert ((&key (type "success") (dismissible nil)) &body body)
  "Generic alert"
  `(with-html-output (*standard-output*)
        (:div :class ,(if dismissible 
                        (format nil "alert alert-~a alert-dismissible" type) 
                        (format nil "alert alert-~a" type)) :role "alert"
            ,(when dismissible
                    `(:button :type "button" :class "close" :data-dismiss "alert" :aria-label "Close"
                        (:span :aria-hidden "true" "&times;")))
            ,@body)))

(defmacro bs-alert-success (&body body)
  "success alert"
  `(bs-alert () ,@body))


(defmacro bs-alert-info (&body body)
  "info alert"
  `(bs-alert (:type "info") ,@body))

(defmacro bs-alert-warning (&body body)
  "success alert"
  `(bs-alert (:type "warning") ,@body))


(defmacro bs-alert-danger (&body body)
  "success alert"
  `(bs-alert (:type "danger") ,@body))

;; EOF
