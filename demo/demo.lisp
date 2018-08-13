(defpackage :cl-bootstrap-demo
  (:use :cl
	:hunchentoot
	:cl-who
	:parenscript
	:cl-bootstrap)
  (:export :start-demo))

(in-package :cl-bootstrap-demo)

(setf (cl-bootstrap::html-mode) :html5)

(defmacro bs-btn ((&key (type "default") (size nil)) &body body)
  `(with-html-output (*standard-output*)
     (:button :type "button" :class
	      (concatenate 'string "btn"
			   (if ,type (format nil " btn-~a" ,type))
			   (if ,size (format nil " btn-~a" ,size)))
                              ,@body)))

(defmacro bs-btn-lg ((&key (type "default")) &body body)
  `(with-html-output (*standard-output*)
                     (:button :type "button" :class (format nil "btn btn-lg btn-~a" ,type)
                              ,@body)))

(defmacro bs-btn-sm ((&key (type "default")) &body body)
  `(with-html-output (*standard-output*)
                     (:button :type "button" :class (format nil "btn btn-sm btn-~a" ,type)
                              ,@body)))

(defmacro bs-btn-xs ((&key (type "default")) &body body)
  `(with-html-output (*standard-output*)
                     (:button :type "button" :class (format nil "btn btn-xs btn-~a" ,type)
                              ,@body)))


(defmacro bs-btn-default (&body body)
  `(bs-btn () ,@body))

(defmacro bs-btn-primary (&body body)
  `(bs-btn (:type "primary") ,@body))

(defmacro bs-btn-success (&body body)
  `(bs-btn (:type "success") ,@body))

(defmacro bs-btn-info (&body body)
  `(bs-btn (:type "info") ,@body))

(defmacro bs-btn-warning (&body body)
  `(bs-btn (:type "warning") ,@body))

(defmacro bs-btn-danger (&body body)
  `(bs-btn (:type "danger") ,@body))

(defmacro bs-link-btn ((&key (type "default") (size nil) (href "#")) &body body)
  `(with-html-output (*standard-output*)
     (:a :role "button" :class (concatenate 'string "btn"
					    (if ,type (format nil " btn-~a" ,type))
					    (if ,size (format nil " btn-~a" ,size))) :href ,href
              ,@body)))

(defmacro bs-btn-dropdown ((&key (title "")) &body body)
  "Turn a button into a dropdown toggle with some basic markup changes."
  `(with-html-output (*standard-output*)
                     (:div :class "btn-group"
                           (:button :type "button"
                                    :class "btn btn-default dropdown-toggle"
                                    :data-toggle "dropdown"
                                    :aria-haspopup "true"
                                    :aria-expanded "false"
                                    ,title
                                    "&nbsp;"
                                    (:span :class "caret"))
                           (:ul :class "dropdown-menu"
                                ,@body))))


(defmacro app-page ((&key title) &body body)
  `(with-html-output-to-string (*standard-output* nil :prologue t :indent t)
        (:html :lang "en"
            (:head
              (:meta :charset "utf-8")
              (:title ,title)
              (:link
                :type "text/css"
                :rel "stylesheet"
                :href  ,*bootstrap-css-url*)
              (:script :src ,*jquery-url*)
              (:script :src ,*bootstrap-js-url*))
            (:body 
	     (bs-navbar (:brand "cl-bootstrap")
		(bs-navbar-nav ()
		    (bs-nav-dropdown (:title "Components")
			(:li (:a :href "/panels" "Panels"))
			(:li (:a :href "/buttons" "Buttons"))
			(:li (:a :href "/labels" "Labels"))
			(:li (:a :href "/modals" "Modal"))
			(:li (:a :href "/tabs" "Tabs"))
			(:li (:a :href "/dropdowns" "Dropdowns"))
			(:li (:a :href "/tables" "Tables"))
			(:li (:a :href "/carousel" "Carousel"))
			(:li (:a :href "/navbars" "Navbars"))
			(:li (:a :href "/forms" "Forms"))
			(:li (:a :href "/button-dropdowns" "Button Dropdowns"))
			(:li (:a :href "/accordions" "Accordions")))))
	    (bs-container ()
		(bs-row
		    (bs-col-md () 
                   ,@body)
                   (:footer :class "clearfix"
                    (:hr)
                    (:p "Copyright &copy; 2016, All rights reserved"))))))))


(hunchentoot:define-easy-handler (app :uri "/") ()
    (app-page (:title "Home page")
                      (bs-well 
                          (:p "hello world")
                          (:p
                            (bs-icon (:glyph "search"))))
                      (bs-alert () "This is a generic alert")
                      (bs-alert (:type "info" :dismissible t) "This is a generic dimissible alert")
                      (bs-alert (:type "info") "This is a generic info alert")
                      (bs-alert (:type "warning") (:strong "Warning!") "This is a generic warning alert")
                      (bs-alert (:type "danger") "This is a generic danger alert")
                      (bs-alert-success  "This is a success alert")
                      (bs-alert-info  "This is a info alert")
                      (bs-alert-warning  "This is a warning alert")
                      (bs-alert-danger  "This is a danger alert")))

(hunchentoot:define-easy-handler (panels :uri "/panels") ()
    (app-page (:title "Panels")
        (bs-panel (:title "Generic Panel") "This is a panel")
        (bs-panel-primary (:title "Primary Panel") "This is a primary panel")
              (bs-panel-success (:title "Success Panel") "This is a success panel")
              (bs-panel-info (:title "Info Panel") "This is a info panel")
              (bs-panel-warning (:title "Warning Panel") "This is a warning panel")
              (bs-panel-danger (:title "Danger Panel") "This is a danger panel")))

(hunchentoot:define-easy-handler (buttons :uri "/buttons") ()
    (app-page (:title "Buttons")
	(bs-btn () "Default button")
        (bs-btn (:type "primary") "Primary button")
        (bs-btn (:type "success") "Success button")
        (bs-btn (:type "warning") "Warning button")
        (bs-btn (:type "danger") "Danger button")
        (bs-btn (:type "info") "Info button") 
        (:br)
        (:h2 "Specific macro")
        (bs-btn-primary "Primary")
        (bs-btn-success "Success")
        (bs-btn-info "Info")
        (bs-btn-warning "Warning")
        (bs-btn-danger "Danger")
        (:h2 "Large buttons")
        (bs-btn-lg () "Default")
        (bs-btn-lg (:type "primary") "Primary")
        (bs-btn-lg (:type "success") "Success")
        (bs-btn-lg (:type "info") "Info")
        (bs-btn-lg (:type "warning") "Warning")
        (bs-btn-lg (:type "danger") "Danger")
        (:h2 "Small buttons")
        (bs-btn-sm () "Default")
        (bs-btn-sm (:type "primary") "Primary")
        (bs-btn-sm (:type "success") "Success")
        (bs-btn-sm (:type "info") "Info")
        (bs-btn-sm (:type "warning") "Warning")
        (bs-btn-sm (:type "danger") "Danger")
        (:h2 "Extra Small buttons")
        (bs-btn-xs () "Default")
        (bs-btn-xs (:type "primary") "Primary")
        (bs-btn-xs (:type "success") "Success")
        (bs-btn-xs (:type "info") "Info")
        (bs-btn-xs (:type "warning") "Warning")
        (bs-btn-xs (:type "danger") "Danger")
	(:h2 "Link buttons")
	(bs-link-btn () "Default")
	(bs-link-btn (:type "primary" :href "http://google.com") "Primary")
	(bs-link-btn (:type "success" :href "http://google.com") "Success")
	(bs-link-btn (:type "warning" :href "http://google.com") "Warning")
	(bs-link-btn (:type "info" :href "http://google.com") "Info")
	(bs-link-btn (:type "danger" :href "http://google.com") "Danger")  ))

(hunchentoot:define-easy-handler (labels-page :uri "/labels") ()
    (app-page (:title "Labels")
        (:h1 "Labels")
        (bs-label () "Default Label")
        (bs-label-primary "Primary Label")
        (bs-label-success "Success Label")
        (bs-label-warning "Warning Label")
        (bs-label-info "Info Label")
        (bs-label-danger "Danger Label")))

(hunchentoot:define-easy-handler (modals :uri "/modals") ()
    (app-page (:title "Modals")
        (:h1 "Modals")
        (:button :type "button" :class "btn btn-primary btn-lg" :data-toggle "modal" :data-target "#myModal" "Launch demo modal")
        (bs-modal (:title "My Modal")
            (:h1 "Modal content")
            (:p "this sis a paragraph"))))

(hunchentoot:define-easy-handler (tabs :uri "/tabs") ()
    (app-page (:title "Tabs")
        (:h2 "Tabs")
	(bs-tab (:fade t) 
	 (:title "Home" :active t :id "home"
		 :content (:div
			   (:h1 "Home")
			   (:p "This is a paragraph")
			   (:ul
			    (:li "One")
			    (:li "One")
			    (:li "One"))))
	    (:title "Profile" :id "profile" :content (:h1 "Profile"))
	    (:title "Messages" :id "messages" :content (:h1 "Messages"))
	    (:title "Settings" :id "settings" :content (:h1 "Settings")))))

(hunchentoot:define-easy-handler (dropdowns :uri "/dropdowns") ()
    (app-page (:title "Dropdowns")
        (:h1 "Dropdowns")
        ;; (bs-dropdown (:title "Dropdown") 
        ;;     (:ul :class "dropdown-menu" :aria-labelledby "dropdownMenu1"
        ;;         (:li (:a :href "#" "Action"))
        ;;         (:li (:a :href "#" "Another Action"))
        ;;         (:li (:a :href "#" "Something else here"))
        ;;         (:li :role "separator" :class "divider")
        ;;         (:li (:a :href "#" "Separated Link"))))
        (:br)
        (:br)
        (bs-dropup (:title "Dropup")
            (:ul  :class "dropdown-menu" :aria-labelledby "dropdownMenu2"
                (:li (:a :href "#" "Action"))
                (:li (:a :href "#" "Another Action"))
                (:li (:a :href "#" "Something else here"))
                (:li :role "separator" :class "divider")
                (:li (:a :href "#" "Separated Link"))))))

(hunchentoot:define-easy-handler (tables :uri "/tables") ()
  (app-page (:title "Tables")
	    (:h1 "Tables")
	    (bs-table
	     (:thead
	      (:tr
		(:th "#") (:th "First Name") (:th "Last Name") (:th "Username")))
	     (:tbody
	      (:tr (:td "1") (:td "Mark") (:td "Otto"))
	    (:tr (:td "1") (:td "Mark") (:td "Otto") (:td "@mdo"))
	    (:tr (:td "1") (:td "Mark") (:td "Otto") (:td "@mdo"))))
	    (bs-table-striped
	     (:thead
	      (:tr (:th "#") (:th "First Name") (:th "Last Name") (:th "Username")))
	     (:tbody
	      (:tr (:td "1") (:td "Mark") (:td "Otto") (:td "@mdo"))
	      (:tr (:td "1") (:td "Mark") (:td "Otto") (:td "@mdo"))
	      (:tr (:td "1") (:td "Mark") (:td "Otto") (:td "@mdo"))))))

(hunchentoot:define-easy-handler (carousel :uri "/carousel") ()
  (app-page (:title "Carousel")
    (:h1 "Carouse page")
    (bs-col-md (:grid 8)
	(bs-carousel (:id "carousel-example-generic")
	    (:image "http://rajasegar.github.io/JADE-Bootstrap/images/slide1.jpg" :caption "Caption 1" :active t)
	    (:image "http://rajasegar.github.io/JADE-Bootstrap/images/slide2.jpg" :caption "Caption 2" )
	    (:image "http://rajasegar.github.io/JADE-Bootstrap/images/slide3.jpg" :caption "Caption 3" )))))

(hunchentoot:define-easy-handler (navbars :uri "/navbars") ()
  (app-page (:title "Navbars")
	    (:h1 "Navbars")
	    (bs-navbar (:inverse t :static-top t :brand "Brand")
		(bs-navbar-nav ()
		    ;(:li (:a :href "/panels" "Panels"))
		    (bs-nav-li (:href "/panels") "Panels")
		    (bs-nav-dropdown (:title "Components")
			(bs-nav-li (:href "/panels") "Panels")
			(:li (:a :href "/buttons" "Buttons"))
			(:li (:a :href "/labels" "Labels"))
			(:li (:a :href "/modals" "Modal"))
			(:li (:a :href "/tabs" "Tabs"))
			(:li (:a :href "/dropdowns" "Dropdowns"))
			(:li (:a :href "/tables" "Tables"))
			(:li (:a :href "/carousel" "Carousel"))
			(:li (:a :href "/navbars" "Navbars"))))
		(bs-navbar-form ()
		    (:div
			(:div :class "form-group"
			    (:input :type "text" :class "form-control" :placeholder "Search"))
			(:button :type "submit" :class "btn btn-default" "Submit")))
		)
	    (bs-navbar ( :fluid t :brand "Brand")
		       (bs-navbar-nav (:right t)
				      (:li (:a :href "#" "Link1"))
				      (:li (:a :href "#" "Link2"))
				      (:li (:a :href "#" "Link3"))))))

(hunchentoot:define-easy-handler (accordions :uri "/accordions") ()
  (app-page (:title "Accordions")
	    (:h1 "Accordions")
	    (bs-accordion (:id "accordion")
		(bs-accordion-item (:id "collapseOne" :title "Accordion 1" :parent "accordion" :active t)
		    "Lorem ipsum dolor sit amet")
		(bs-accordion-item (:id "collapseTwo" :title "Accordion 2" :parent "accordion")
		    "Lorem ipsum dolor sit amet")
		(bs-accordion-item (:id "collapseThree" :title "Accordion 3" :parent "accordion")
		    "Lorem ipsum dolor sit amet"))))

(hunchentoot:define-easy-handler (forms :uri "/forms") ()
  (app-page (:title "cl-bootstrap Forms")
	    (:h1 "Forms")
	    (:form
	     (bs-form-email ())
	     (bs-form-password ())
	     (bs-form-file ())
	     (bs-form-checkbox "Check me out")
	    (:button :type "submit" :class "btn btn-default" "Submit"))))

(hunchentoot:define-easy-handler (button-dropdowns :uri "/button-dropdowns")()
                                 (app-page (:title "cl-bootstrap Button dropdowns")
                                           (:h1 "Button dropdowns")
                                           (bs-btn-dropdown (:title "Default")
                                                            (:li (:a :href "#" "Action"))
                                                            (:li (:a :href "#" "Another Action"))
                                                            (:li (:a :href "#" "Something else here"))
                                                            (:li :role "separator" :class "divider")
                                                            (:li (:a :href "#" "Separated link")))))

(push (hunchentoot:create-folder-dispatcher-and-handler "/css/" "public/css/") hunchentoot:*dispatch-table*)
(push (hunchentoot:create-folder-dispatcher-and-handler "/js/" "public/js/") hunchentoot:*dispatch-table*)
(push (hunchentoot:create-folder-dispatcher-and-handler "/fonts/" "public/fonts/") hunchentoot:*dispatch-table*)

(defun start-demo()
    (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 3000)))
