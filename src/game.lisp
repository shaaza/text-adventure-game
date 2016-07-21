(load "game-data.lisp")

;;;; Pure Functions

;;;; Scene describers.


;;; Operations on Nodes

;; ['key, 'nodes a-list] -> ['(value)]
;; Given the key (location) of an a-list item and the a-list, returns the value (description of location).

(defun describe-location (location nodes) 
       (cadr (assoc location nodes)))
					 
;;; Operations on Edges


;; ['location, 'edges a-list] -> ['(Generated sentence description for each path from the given location.')]
; Given location, output multiple path description for the locn.

(defun describe-paths (location edges)
                      (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

;; ['(location direction mode-of-movt)] -> ['(Generated Sentence)]
;; Convert path data to textual description

(defun describe-path (edge)
      `(There is a ,(cadr edge) going ,(caddr edge) from here.))

								  

;; ['location, 'object-locations a-list] -> ['(Generated sentence description for each object in the given location.')]
;; Given location and an a-list of object-locations, return multiple path descript
				  
(defun describe-objects (location object-locations)
                        (apply #'append (mapcar #'describe-object (cdr (assoc location object-locations)))))

;; ['(object)] -> ['(Generated Sentence)]
;; Convert path data to textual description

(defun describe-object (objects) 
                       `(There is a ,(car objects) on the floor.))						

;; ['location, 'object-locations a-list] -> []
(defun objects-at (location object-locations)
                  (mapcar #'car (cdr (assoc location object-locations))))





;;; Actions

;; Look around current location
; Variable: Location state
(defparameter *location* 'living-room)


; Function: Describe scenery, paths and objects. [Not functional]

(defun look () (append (describe-location *location* *nodes*) (describe-paths *location* *edges*) (describe-objects *location* *object-locations*)))
			
;; Walk around the world [Not functional]

(defun walk (direction)
            (let ((next (find direction (cdr (assoc *location* *edges*)) :key #'cadr)))
			    (if next 
			    (progn (setf *location* (car next)) (look)) 
				'(You cannot go that way))))
			
;; Pickup Objects [Not functional]
(defun pickup (object)
            (cond ((member object (objects-at *location* *object-locations*)) (push `(body ,(list object)) *object-locations*) '(You are now carrying the object.))
			(t '(You cannot pickup that object.))))			 

;; Drop Objects


;; Examine Inventory
(defparameter *inventory* '()) 
(defun inventory ()
      (cond ((assoc 'body *object-locations*) (push (cdr (assoc 'body *object-locations*)) *inventory*)))
      (append '(Items-) *inventory*))


;;; Test
;; game-repl
; Check if command is acceptable, convert to lisp code, and print user friendly text.
(defun game-repl ()
                (let ((cmd (game-read)))  
                    (unless (eq (car cmd) 'quit) 
					    (game-print (game-eval cmd))
                        (game-repl))))				
;; game-read
; Features: i) Convert commands to lisp code: parentheses, unstring, quote

(defun game-read ()
        (let ((input (read-line)))
		    (cond 
			    (input (let ((stringd (read-from-string (concatenate 'string "(" input ")"))))  
					        (flet ((quote-it (x) (list 'quote x)))
								(cons (car stringd) (mapcar #'quote-it (cdr stringd)))))))))
										 
												 
					 
;; game-eval
; Features: check acceptability of code     
(defparameter *allowed-commands* '(walk look pickup quit inventory))

(defun game-eval (command)
                  (cond 
				        ((member (car command) *allowed-commands*)
						         (eval command))
                        (t '(i do not know that command.))))								 
;; game-print Format text
(defun tweak-text (lst caps lit)
       (when lst
       (let ((item (car lst))
	         (rest (cdr lst)))
			 (cond 
                   ((eq item #\space) (cons item (tweak-text rest caps lit)))
                   ((member item '(#\? #\! #\.)) (cons item (tweak-text rest t lit)))
                   ((eq item #\") (tweak-text rest caps (not lit)))
                   (lit (cons item (tweak-text rest nil lit)))
                   (caps (cons (char-upcase item) (tweak-text rest nil lit)))
                   (t (cons (char-downcase item) (tweak-text rest nil nil)))
                   ))))

(defun game-print (toprint)
        (princ (coerce (tweak-text (coerce (string-trim "()" (prin1-to-string toprint))
                                           'list)
                                   t
                                   nil)
						'string))
		(fresh-line))

						
; Spaces: as is; Capitalize new line letters;  Lower case rest; Replace
  
         
; (game-repl)