;; button-dropdowns.lisp

(in-package :cl-bootstrap)

(defmacro bs-btn-dropdown ((&key (title "")) &body body)
  "Turn a button into a dropdown toggle with some basic markup changes."
  `(with-html-output (*standard-output*)
                     (:div :class "btn-group"
                           (:button :type "button"
                                    :class "btn btn-default dropdown-toggle"
                                    :data-toggle "dropdown"
                                    :aria-haspopup "true"
                                    :aria-expanded "false"
                                    ,title
                                    "&nbsp;"
                                    (:span :class "caret"))
                           (:ul :class "dropdown-menu"
                                ,@body))))
