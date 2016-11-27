;; file: forms.lisp

(in-package :cl-bootstrap)

(defmacro bs-form-input (type (&key label id name placeholder))
  (let ((g-id (gensym))
	(g-name (gensym))
	(g-placeholder (gensym)))
    `(let ((,g-id ,id)
	   (,g-name ,name)
	   (,g-placeholder ,placeholder))
       (with-html-output (*standard-output*)
	 (:div :class "form-group"
	       (:label :for ,g-id ,label)
	       (:input :type ,type :class "form-control"
		       :id ,g-id
		       ,@(when g-name `(:name ,g-name))
		       ,@(when g-placeholder `(:placeholder ,g-placeholder))))))))

(defmacro bs-form-email ((&key (label "Email address: ") (id nil) (name nil) (placeholder "Email")))
  `(bs-form-input "email" (:label ,label :id ,id :name ,name :placeholder ,placeholder)))

(defmacro bs-form-password ((&key (label "Password: ") (id nil) (name nil) (placeholder "Password")))
  `(bs-form-input "password" (:label ,label :id ,id :name ,name :placeholder ,placeholder)))

(defmacro bs-form-file ((&key (label "File Input: ") (id nil) (name nil)))
  `(bs-form-input "file" (:label ,label :id ,id :name ,name)))

(defmacro bs-form-checkbox (&body body)
  `(with-html-output (*standard-output*)
     (:div :class "checkbox"
	   (:label
	    (:input :type "checkbox" ,@body)))))
;; EOF
