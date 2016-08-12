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
                :href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"))
            (:body ,@body))))

(hunchentoot:define-easy-handler (app :uri "/") ()
    (app-page (:title "Home page")
              (bs-navbar (:inverse nil :brand "cl-bootstrap"))
              (bs-container (:fluid nil)
                (bs-row
                  (bs-col-md (:grid 12 :offset 0)
                      (bs-well 
                          (:p "hello world")
                          (:p
                            (bs-icon (:glyph "search"))))
                      (bs-alert () "This is a generic alert")
                      (bs-alert-success  "This is a success alert")
                      (bs-alert (:type "info") "This is a generic info alert")
                      (bs-alert (:type "warning") "This is a generic warning alert")
                      (bs-alert (:type "danger") "This is a generic danger alert")
                      
                      )))
              
              
              ))

(defun start-server()
    (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 3000)))

(start-server)
