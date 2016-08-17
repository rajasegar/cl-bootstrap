;; file: tabs.lisp

(in-package :cl-bootstrap)

(defmacro bs-tab ((&rest navs ) &body body)
  `(with-html-output (*standard-output*)
        (:div
            (:ul :class "nav nav-tabs" :role "tablist")
            (:div :class "tab-content"
                ,@body))))

(defmacro bs-tab-pane ((&key (active nil) (id nil)) &body body)
  `(with-html-output (*standard-output*)
        (:div :role "tabpanel" :class ,(if active "tab-pane active" "tab-pane") :id ,id
            ,@body)))
;; EOF
