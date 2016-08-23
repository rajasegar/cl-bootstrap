;; file: forms.lisp

(in-package :cl-bootstrap)

(defmacro bs-form-email ((&key (label "Email address: ") (id nil) (placeholder "Email")))
  `(with-html-output (*standard-output*)
     (:div :class "form-group"
	   (:label :for ,id ,label)
	   (:input :type "email" :class "form-control" :id ,id :placeholder ,placeholder)))) 

(defmacro bs-form-password ((&key (label "Password: ") (id nil) (placeholder "Password")))
  `(with-html-output (*standard-output*)
     (:div :class "form-group"
	   (:label :for ,id ,label)
	   (:input :type "password" :class "form-control" :id ,id :placeholder ,placeholder))))

(defmacro bs-form-file ((&key (label "File Input: ") (id nil)))
  `(with-html-output (*standard-output*)
     (:div :class "form-group"
	   (:label :for ,id ,label)
	   (:input :type "file" :id ,id))))

(defmacro bs-form-checkbox (&body body)
  `(with-html-output (*standard-output*)
     (:div :class "checkbox"
	   (:label
	    (:input :type "checkbox" ,@body)))))
;; EOF
