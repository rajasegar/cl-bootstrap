(in-package :cl-bootstrap)

(defvar *alert-padding* "1rem")
(defvar *spacer-y* "1rem")
(defvar *alert-border* "1px solid transparent")
(defvar *alert-link-font-weight* "bold")
(defvar *alert-success-bg* "#dff0d8")
(defvar *alert-success-border* "#dff0d8")
(defvar *alert-success-body* "#3c763d")
(defvar *alert-link-font-weight* "bold")
(defvar *alert-padding-x* "1.25rem")



(defun cl-bootstrap-css ()
  (lass:compile-and-write
   `(.alert
    :background "#ccc"
    :padding ,*alert-padding*
    :margin-bottom ,*spacer-y*
    :border ,*alert-border*
    :border-radius ".25rem")

   '(.alert-heading
    ;; Specified to prevent conflicts of changing *headings-color*
    :color inherit)

   ;; Provide class for links that match alers
   `(.alert-link
     :font-weight ,*alert-link-font-weight*)

   ;; Disimissible alerts
   ;;
   ;; Expand the right padding and account for the close button's positioning

   `(.alert-dismissible
     :padding-right 2rem

     ;; Adjust close link position
     (.close
      :position relative
      :top -.125rem
      :right ,*alert-padding-x*
      :color inherit))

   `(.alert-success
     :background-color ,*alert-success-bg*
     :border-color ,*alert-success-border*
     :color ,*alert-success-body*
     (hr
      :border-top-color ,*alert-success-border*)
     (.alert-link
      :color ,*alert-success-body*))

   ))



