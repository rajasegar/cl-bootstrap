;; file: tabs.lisp

(in-package :cl-bootstrap)

(defun tabpanel-class (active fade)
  (concatenate 'string "tab-pane "  (if fade " fade " nil) (if active " in active " nil)))

(defmacro bs-tab-pane ((&key (active nil) (id nil) (fade nil)) &body body)
  `(with-html-output (*standard-output*)
        (:div :role "tabpanel" :class (tabpanel-class ,active ,fade)  :id ,id
            ,@body)))

(defmacro bs-tab-nav (title active url)
  `(with-html-output (*standard-output*)
     (:li :role "presentation" :class ,(if active "active" "")
	  (:a :href (format nil "#~a" ,url) :data-toggle "tab" ,title))))

(defmacro bs-tab ((&key (fade nil)) &rest rest)
  `(with-html-output (*standard-output*)
     (:div
	(:ul :class "nav nav-tabs" :role "tablist"
	    ,@(loop for tab in rest
		collect (destructuring-bind (&key title active id content) tab
			  `(bs-tab-nav  ,title  ,active  ,id))))
	(:div :class "tab-content"
	      ,@(loop for tab in rest
		   collect (destructuring-bind (&key title active id content) tab
			`(bs-tab-pane (:active ,active :id ,id :fade ,fade) ,content)))))))



;; EOF
