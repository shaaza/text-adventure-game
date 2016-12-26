;;;; Scene describers. (All purely functional)

;;; Operations on Nodes

; @func describe-location
; @mapping ['key, 'nodes a-list] -> ['(value)]
; @desc Given the key (location) of an a-list item and the a-list, returns the value (description of location).

(defun describe-location (location nodes)
       (cadr (assoc location nodes)))

;;; Operations on Edges

; @func describe-paths
; @mapping ['location, 'edges a-list] -> ['(Generated sentence description for each path from the given location.)]
; @desc Given location, output multiple path description for the locn.

(defun describe-paths (location edges)
                      (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

;; ['(location direction mode-of-movt)] -> ['(Generated Sentence)]
;; Convert path data to textual description

(defun describe-path (edge)
      `(There is a ,(cadr edge) going ,(caddr edge) from here.))



;; ['location, 'object-locations a-list] -> ['(Generated sentence description for each object in the given location.')]
;; Given location and an a-list of object-locations, return multiple path descript

(defun describe-objects (location object-locations)
                        (apply #'append (mapcar #'describe-one-object (cdr (assoc location object-locations)))))

;; ['(object)] -> ['(Generated Sentence)]
;; Convert path data to textual description

(defun describe-one-object (objects)
                       `(There is a ,(car objects) on the floor.))

;; ['location, 'object-locations a-list] -> []
(defun objects-at (location object-locations)
                  (mapcar #'car (cdr (assoc location object-locations))))
