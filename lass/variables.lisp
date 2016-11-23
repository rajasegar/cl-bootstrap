(in-package :cl-bootstrap)


(defun color-name-to-rgb (color &optional frame)
  "Convert COLOR string to a list of normalized RGB components.
COLOR should be a color name (e.g. \"white\") or an RGB triplet
string (e.g. \"#ff12ec\").
Normally the return value is a list of three floating-point
numbers, (RED GREEN BLUE), each between 0.0 and 1.0 inclusive.
Optional argument FRAME specifies the frame where the color is to be
displayed.  If FRAME is omitted or nil, use the selected frame.
If FRAME cannot display COLOR, return nil."
  ;; `colors-values' maximum value is either 65535 or 65280 depending on the
  ;; display system.  So we use a white conversion to get the max value.
  (let ((valmax (float (car (color-values "#ffffff")))))
    (mapcar (lambda (x) (/ x valmax)) (color-values color frame))))

(defun color-rgb-to-hsl (red green blue)
  "Convert RGB colors to their HSL representation.
RED, GREEN, and BLUE should each be numbers between 0.0 and 1.0,
inclusive.  Return a list (HUE SATURATION LUMINANCE), where
each element is between 0.0 and 1.0, inclusive."
  (let* ((r red)
         (g green)
         (b blue)
         (max (max r g b))
         (min (min r g b))
         (delta (- max min))
         (l (/ (+ max min) 2.0)))
    (if (= delta 0)
        (list 0.0 0.0 l)
        (let* ((s (if (<= l 0.5) (/ delta (+ max min))
                      (/ delta (- 2.0 max min))))
               (rc (/ (- max r) delta))
               (gc (/ (- max g) delta))
               (bc (/ (- max b) delta))
               (h  (mod
                    (/
                     (cond
                       ((= r max)      (- bc gc))
                       ((= g max)      (+ 2.0 rc (- bc)))
                       (t              (+ 4.0 gc (- rc))))
                     6.0) 1.0)))
          (list h s l)))))

(defvar *state-success-text* "#3c763d")
(defvar *state-success-bg* "#dff0d8")
(defvar *state-success-border* "#3c763d")
