;;; Actions: UI
;; These are functions that allow the user to change the game state, as well as navigate through scene graph.
;; These are essentially functions that interact with game-state based on game-data

;; @desc A list of user inputs that are allowed.
(defparameter *allowed-commands* '(walk look pickup quit inventory))

; @func look
; @desc Describe scenery, paths and objects, i.e. allows you to 'look around the current location'
; @note This is not functional, but could be made functional by passing in *location*, *nodes*, *edges* amd *object-locations*

(defun look () (append (describe-location *location* *nodes*) (describe-paths *location* *edges*) (describe-objects *location* *object-locations*)))

; @func walk
; @desc Change the location state depending on where the user wants to go, i.e. 'Walk around the world'
; @note It's not functional. But it's worth thinking how it could be made functional.

(defun walk (direction)
            (let ((next (find direction (cdr (assoc *location* *edges*)) :key #'cadr)))
    			    (if next
      			    (progn (setf *location* (car next)) (look))
      				 '(You cannot go that way))))

; @func pickup
; @desc Append objects to the inventory (consider a 'body' location in object-locations) i.e. 'Pickup objects'
; @note Not functional, mutates state.

(defun pickup (object)
            (cond ((member object (objects-at *location* *object-locations*)) (push `(body ,(list object)) *object-locations*) '(You are now carrying the object.))
			            (t '(You cannot pickup that object.))))

; @stub
; @func drop
; @desc Remove objects form body location to corresponding object locations element.


; @func inventory
; @desc Examine Inventory

(defun inventory ()
      (cond ((assoc 'body *object-locations*) (push (cdr (assoc 'body *object-locations*)) *inventory*)))
      (append '(Items-) *inventory*))
