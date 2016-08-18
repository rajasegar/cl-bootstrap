;; file: carousel.lisp
(in-package :cl-bootstrap)

(defmacro carousel-indicator ((&key (target nil) (index nil) (active nil)))
  `(with-html-output (*standard-output*)
     (:li :data-target (format nil "#~a" ,target) :data-slide ,index :class ,(if active "active" nil))))

(defmacro carousel-slide ((&key image (caption nil) (active nil)))
  `(with-html-output (*standard-output*)
     (:div :class ,(if active "item active" "item")
	   (:img :src ,image :alt ,caption)
	   (:div :class "carousel-caption" ,caption))))

(defmacro bs-carousel ((&key (id "")) &rest rest)
  `(with-html-output (*standard-output*)
     (:div :id ,id :class "carousel slide" :data-ride "carousel"
	; Indidcators
	   (:ol :class "carousel-indicators"
		,@(loop for slide in rest
			collect `(carousel-indicator (:target ,id :index ,(position slide rest) )))) 
	; Wrapper for slides
	   (:div :class "carousel-inner" :role "listbox"
		 ,@(loop for slide in rest
		      collect (destructuring-bind (&key image caption (active nil)) slide
				  `(carousel-slide (:image ,image :caption ,caption :active ,active)))))
	; Controls
	   (:a :class "left carousel-control" :href "#carousel-example-generic" :role "button" :data-slide "prev"
	       (:span :class "glyphicon glyphicon-chevron-left" :aria-hidden "true")
	       (:span :class "sr-only" "Previous"))
	   (:a :class "right carousel-control" :href "#carousel-example-generic" :role "button" :data-slide "next"
	       (:span :class "glyphicon glyphicon-chevron-right" :aria-hidden "true")
	       (:span :class "sr-only" "Next")))))

;; EOF
