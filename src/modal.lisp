;; file: modal.lisp

(in-package :cl-bootstrap)

(defmacro bs-modal ((&key (title "")) &body body)
  `(with-html-output (*standard-output*)
        (:div  :class "modal fade" :id "myModal" :tabindex "-1" :role "dialog"
            (:div :class "modal-dialog" :role "document"
                (:div :class "modal-content"
                    (:div :class "modal-header"
                        (:button :type "button" :class "close" :data-dismiss "modal" :aria-label "Close"
                            (:span :aria-hidden "true" "&times;"))
                        (:h4 :class "modal-title" ,title))
                    (:div :class "modal-body"
                        ,@body)
                    (:div :class "modal-footer"
                        (:button :type "button" :class "btn btn-default" :data-dismiss "modal" "Close")
                        (:button :type "button" :class "btn btn-primary" "Save")))))))

;; EOF
