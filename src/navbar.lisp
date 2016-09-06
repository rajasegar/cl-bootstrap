;; file: navbar.lisp

(in-package :cl-bootstrap)

(defmacro bs-navbar-nav ((&key (right nil)) &body body)
  `(with-html-output (*standard-output*)
	(:ul :class ,(if right "nav navbar-nav navbar-right" "nav navbar-nav")
	     ,@body)))


(defmacro bs-navbar ((&key
                      (fluid nil)
                      (inverse nil)
                      (fixed-top nil)
                      (fixed-bottom nil)
                      (static-top nil)
                      (brand "Brand")) &body body)
  "Navbar"
  `(with-html-output (*standard-output*)
                     (:nav :class  ,(concatenate 'string "navbar"
                                                 (if inverse " navbar-inverse" " navbar-default")
                                                 (if fixed-top " navbar-fixed-top" nil)
                                                 (if fixed-bottom " navbar-fixed-bottom" nil)
                                                 (if static-top " navbar-static-top" nil))
            (:div :class ,(if fluid "container-fluid" "container")
                (:div :class "navbar-header"
                    (:button :type "button" :class "navbar-toggle collapsed" :data-toggle "collapse" :data-target "#bs-example-navbar-collapse-1" :aria-expanded "false"
                        (:span :class "sr-only" "Toggle navigation")
                        (:span :class "icon-bar")
                        (:span :class "icon-bar")
                        (:span :class "icon-bar"))
                    (:a :class "navbar-brand" :href "/" ,brand))
	    (:div :class "collapse navbar-collapse" :id "bs-example-navbar-collapse-1"
		,@body)))))

(defmacro bs-nav-li ((&key (active nil) (href "#")) &body body)
  `(with-html-output (*standard-output*)
     (:li :class ,(if active "active" nil)
	  (:a :href ,href
	      ,@body))))

(defmacro bs-nav-dropdown ((&key (title "")) &body body)
  `(with-html-output (*standard-output*)
     (:li :class "dropdown"
	  (:a :href "#" :class "dropdown-toggle" :data-toggle "dropdown" :role "button" :aria-haspopup "true" :aria-expanded "false"
	      ,title
	      "&nbsp;"
	      (:span :class "caret"))
	  (:ul :class "dropdown-menu"
	       ,@body))))

(defmacro bs-navbar-form ((&key (right nil)) &body body)
  `(with-html-output (*standard-output*)
     (:form :class ,(if right "navbar-form navbar-right" "navbar-form navbar-left") :role "search"
	,@body)))
;; EOF
