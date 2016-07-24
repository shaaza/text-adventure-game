;;; Actions: UI - Essentially functions that interact with game-state based on game-data

(defparameter *allowed-commands* '(walk look pickup quit inventory))
;; Look around current location


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
(defun inventory ()
      (cond ((assoc 'body *object-locations*) (push (cdr (assoc 'body *object-locations*)) *inventory*)))
      (append '(Items-) *inventory*))