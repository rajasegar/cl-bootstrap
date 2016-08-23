;; file: accordion.lisp

(in-package :cl-bootstrap)

(defmacro bs-accordion-item ((&key (title "") (id "") (parent "") (active nil)) &body body)
  `(with-html-output (*standard-output*)
     (:div :class "panel panel-default"
		 (:div :class "panel-heading" :role "tab" :id "headingOne"
		       (:h4 :class "panel-title"
			    (:a :role "button" :data-toggle "collapse" :data-parent (format nil "#~a" , parent) :href (format nil "#~a" ,id)  :aria-expanded "true" :aria-controls "collapseOne" ,title)))
		 (:div :id ,id :class ,(if active "panel-collapse collapse in" "panel-collapse collapse") :role "tabpanel" :aria-labelledby "headingOne"
		       (:div :class "panel-body"
			     ,@body)))))


(defmacro bs-accordion ((&key (id "")) &body body)
  `(with-html-output (*standard-output*)
     (:div :class "panel-group" :id ,id :role "tablist" :aria-multiseletable "true"
	   ,@body)))

;; EOF
