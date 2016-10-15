(in-package :cl-bootstrap)

(defparameter *bootstrap-css-url* "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css")
(defparameter *jquery-url*  "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js")
(defparameter *bootstrap-js-url* "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js")

(defmacro bs-page ((&rest header) &body body)
  `(with-html-output-to-string (*standard-output* nil
						  :prologue "<!DOCTYPE html>")
     (:html
      (:head
       (:meta :charset "utf-8")
       (:meta :name "viewport" :content "width=device-width,initial-scale=1")
       (:link :rel "stylesheet" :href ,*bootstrap-css-url*)
       (:script :src ,*jquery-url*)
       (:script :src ,*bootstrap-js-url*)
       ,@header)
      (:body
       ,@body))))

