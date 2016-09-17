# cl-bootstrap
Common Lisp web development widget library for Twitter's Bootstrap

[![Quicklisp](http://quickdocs.org/badge/cl-bootstrap.svg)](http://quickdocs.org/cl-bootstrap/)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)

Widgets are implemented as a macro library which can easily be used in your Common Lisp web development projects, eliminating all Web UI boilerplate code; includes automatic generation of tables and responsive grids from a list of renderable elements.

## Bootstrap
[Bootstrap](http://getbootstrap.com)


## Dependencies
[cl-who](https://github.com/edicl/cl-who)

## Installation
cl-bootstrap is available on [Quicklisp](http://quicklisp.org)
```lisp
(ql:quickload "cl-bootstrap")
```


## Documentation

### Alerts

```lisp
(bs-alert () "This is a generic alert")
(bs-alert (:type "info" :dismissible t) "This is a generic dimissible alert")
(bs-alert (:type "info") "This is a generic info alert")
(bs-alert (:type "warning") (:strong "Warning!") "This is a generic warning alert")
(bs-alert (:type "danger") "This is a generic danger alert")
(bs-alert-success  "This is a success alert")
(bs-alert-info  "This is a info alert")
(bs-alert-warning  "This is a warning alert")
(bs-alert-danger  "This is a danger alert")
```

### Panels
```lisp
(bs-panel () "This is a panel")
(bs-panel-primary "This is a primary panel")
(bs-panel-success "This is a success panel")
(bs-panel-info "This is a info panel")
(bs-panel-warning "This is a warning panel")
(bs-panel-danger "This is a danger panel")
```

### Buttons
```lisp
(bs-btn () "Default button")
(bs-btn (:type "primary") "Primary button")
(bs-btn (:type "success") "Success button")
(bs-btn (:type "warning") "Warning button")
(bs-btn (:type "danger") "Danger button")
(bs-btn (:type "info") "Info button") 
(bs-btn-primary "Primary")
(bs-btn-success "Success")
(bs-btn-info "Info")
(bs-btn-warning "Warning")
(bs-btn-danger "Danger")
``` 

### Labels
```lisp
(bs-label () "Default Label")
(bs-label-primary "Primary Label")
(bs-label-success "Success Label")
(bs-label-warning "Warning Label")
(bs-label-info "Info Label")
(bs-label-danger "Danger Label")
```

### Models
```lisp
(:button :type "button" :class "btn btn-primary btn-lg" :data-toggle "modal" :data-target "#myModal" "Launch demo modal")
(bs-modal (:title "My Modal")
	(:h1 "Modal content")
	(:p "this sis a paragraph"))
```

### Tabs
```lisp
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
	(:title "Settings" :id "settings" :content (:h1 "Settings")))
```

### Carousel
```lisp
(bs-carousel (:id "carousel-example-generic")
	(:image "http://rajasegar.github.io/JADE-Bootstrap/images/slide1.jpg" :caption "Caption 1" :active t)
	(:image "http://rajasegar.github.io/JADE-Bootstrap/images/slide2.jpg" :caption "Caption 2" )
	(:image "http://rajasegar.github.io/JADE-Bootstrap/images/slide3.jpg" :caption "Caption 3" ))
```

### Navbars
```lisp
(bs-navbar (:inverse t :brand "Brand")
	(bs-navbar-nav ()
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
			(:button :type "submit" :class "btn btn-default" "Submit"))))
```

### Accordion
```lisp
(bs-accordion (:id "accordion")
	(bs-accordion-item (:id "collapseOne" :title "Accordion 1" :parent "accordion" :active t)
		"Lorem ipsum dolor sit amet")
	(bs-accordion-item (:id "collapseTwo" :title "Accordion 2" :parent "accordion")
		"Lorem ipsum dolor sit amet")
	(bs-accordion-item (:id "collapseThree" :title "Accordion 3" :parent "accordion")
		"Lorem ipsum dolor sit amet"))
```


### Forms
```lisp
(:form
	(bs-form-email ())
	(bs-form-password ())
	(bs-form-file ())
	(bs-form-checkbox "Check me out")
	(:button :type "submit" :class "btn btn-default" "Submit"))
```



## License

Copyright © 2016, Rajasegar Chandran <rajasegar.c@gmail.com>. This project has been released under the MIT License; please see cl-bootstrap/LICENSE for more information.
