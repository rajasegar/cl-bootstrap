;; dropdowns.lisp

(in-package :cl-bootstrap)

(defmacro bs-dropdown ((&key (title "")) &body body)
  "Toggleable, contextual menu for displaying lists of links."
  `(with-html-output (*standard-output*)
        (:div :class "dropdown" 
            (:button :class "btn btn-default dropdown-toggle" :type "button" :id "dropdownMenu1" :data-toggle "dropdown" :aria-haspopup "true" :aria-expanded "true"
                ,title
                "&nbsp;"
                (:span :class "caret"))
            ,@body)))

(defmacro bs-dropup ((&key (title "")) &body body)
  "Toggleable, contextual menu for displaying lists of links."
  `(with-html-output (*standard-output*)
        (:div :class "dropup" 
            (:button :class "btn btn-default dropdown-toggle" :type "button"  :data-toggle "dropdown" :aria-haspopup "true" :aria-expanded "false"
                ,title
                "&nbsp;"
                (:span :class "caret"))
            ,@body)))


;; EOF
