(ql:quickload '(:cl-who :hunchentoot))
(asdf:operate 'asdf:load-op 'cl-bootstrap)
(in-package :cl-bootstrap)

(setf (html-mode) :html5)

(defmacro app-page ((&key title) &body body)
  `(with-html-output-to-string (*standard-output* nil :prologue t :indent t)
        (:html :lang "en"
            (:head
              (:meta :charset "utf-8")
              (:title, title)
              (:link
                :type "text/css"
                :rel "stylesheet"
                :href "/css/bootstrap.min.css")
              (:script :src "/js/jquery.min.js")
              (:script :src "/js/bootstrap.min.js"))
            (:body 
                (bs-navbar (:brand "cl-bootstrap"))
                (bs-container ()
                    (bs-row
                        (bs-col-md () 
              ,@body)))))))


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

(define-easy-handler (panels :uri "/panels") ()
    (app-page (:title "Panels")
        (bs-panel () "This is a panel")
        (bs-panel-primary "This is a primary panel")
        (bs-panel-success "This is a success panel")
        (bs-panel-info "This is a info panel")
        (bs-panel-warning "This is a warning panel")
        (bs-panel-danger "This is a danger panel")))

(define-easy-handler (buttons :uri "/buttons") ()
    (app-page (:title "Buttons")
        (:h1 "Buttons")
        (bs-btn () "Default button")
        (bs-btn (:type "primary") "Primary button")
        (bs-btn (:type "success") "Success button")
        (bs-btn (:type "warning") "Warning button")
        (bs-btn (:type "danger") "Danger button")
        (bs-btn (:type "info") "Info button") 
        (:br)
        (bs-btn-primary "Primary")
        (bs-btn-success "Success")
        (bs-btn-info "Info")
        (bs-btn-warning "Warning")
        (bs-btn-danger "Danger")
        
        ))

(define-easy-handler (labels-page :uri "/labels") ()
    (app-page (:title "Labels")
        (:h1 "Labels")
        (bs-label () "Default Label")
        (bs-label-primary "Primary Label")
        (bs-label-success "Success Label")
        (bs-label-warning "Warning Label")
        (bs-label-info "Info Label")
        (bs-label-danger "Danger Label")))

(define-easy-handler (modals :uri "/modals") ()
    (app-page (:title "Modals")
        (:h1 "Modals")
        (:button :type "button" :class "btn btn-primary btn-lg" :data-toggle "modal" :data-target "#myModal" "Launch demo modal")
        (bs-modal (:title "My Modal")
            (:h1 "Modal content")
            (:p "this sis a paragraph"))))

(define-easy-handler (tabs :uri "/tabs") ()
    (app-page (:title "Tabs")
        (:h1 "Tabs")
        (bs-tab ( '("home" "profile" "messages" "settings"))
            (bs-tab-pane (:active t :id "home")
                (:h1 "Home Tab")
                (:p "Lorem ipsum dolor sit amet"))
            (bs-tab-pane ( :id "profile")
                (:h1 "Profile Tab")
                (:p "Lorem ipsum dolor sit amet"))
            (bs-tab-pane ( :id "messages")
                (:h1 "Messages Tab")
                (:p "Lorem ipsum dolor sit amet"))
            (bs-tab-pane ( :id "settings")
                (:h1 "Settings Tab")
                (:p "Lorem ipsum dolor sit amet")))))

(define-easy-handler (dropdowns :uri "/dropdowns") ()
    (app-page (:title "Dropdowns")
        (:h1 "Dropdowns")
        (bs-dropdown (:title "Dropdown")
            (:ul :class "dropdown-menu" :aria-labelledby "dropdownMenu1"
                (:li (:a :href "#" "Action"))
                (:li (:a :href "#" "Another Action"))
                (:li (:a :href "#" "Something else here"))
                (:li :role "separator" :class "divider")
                (:li (:a :href "#" "Separated Link"))))
        (:br)
        (:br)
        (bs-dropup (:title "Dropup")
            (:ul :class "dropdown-menu" :aria-labelledby "dropdownMenu2"
                (:li (:a :href "#" "Action"))
                (:li (:a :href "#" "Another Action"))
                (:li (:a :href "#" "Something else here"))
                (:li :role "separator" :class "divider")
                (:li (:a :href "#" "Separated Link"))))))

(define-easy-handler (tables :uri "/tables") ()
  (app-page (:title "Tables")
	    (:h1 "Tables")
	    (bs-table
	     (:thead
	      (:tr
		(:th "#") (:th "First Name") (:th "Last Name") (:th "Username")))
	     (:tbody
	      (:tr (:td "1") (:td "Mark") (:td "Otto"))
	    (:tr (:td "1") (:td "Mark") (:td "Otto") (:td "@mdo"))
	    (:tr (:td "1") (:td "Mark") (:td "Otto") (:td "@mdo"))))))
                


(defun start-server()
    (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 3000)))

(push (create-folder-dispatcher-and-handler "/css/" "public/css/") *dispatch-table*)
(push (create-folder-dispatcher-and-handler "/js/" "public/js/") *dispatch-table*)
(push (create-folder-dispatcher-and-handler "/fonts/" "public/fonts/") *dispatch-table*)


(start-server)
