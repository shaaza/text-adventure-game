(defparameter *nodes* '((garden (There is a beautiful garden)) (living-room (There is an old man sleeping on the couch)) (attic (There is a lot of dust and mangoes))))`

(defun describe-location (location nodes) (cadr (assoc location nodes)))

(defparameter *edges* '((garden (living-room west door)) (living-room (attic north ladder) (garden east door) ) (attic (living-room south ladder))))

(defun describe-path (edge) `(There is a ,(cadr edge) going ,(caddr edge) from here.) )

(defun describe-paths (location edges) (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))


(defparameter *objects* '(whiskey bucket mop toy))

(defparameter *object-locations* '((living-room (whiskey)) (garden (mop) (bucket)) (attic (toy))))

(defun describe-object (objects) `(There is a ,(car objects) on the floor.))

(defun objects-at (location object-locations) (mapcar #'car (cdr (assoc location object-locations))))

(defun describe-objects (location object-locations) (apply #'append (mapcar #'describe-object (cdr (assoc location object-locations)))))

(defparameter *location* 'living-room)

(defun look () (append (describe-location *location* *nodes*) (describe-paths *location* *edges*) (describe-objects *location* *object-locations*)))

(defun walk (direction) (let ((next (find direction (cdr (assoc *location* *edges*)) :key #'cadr))) (if next (progn (setf *location* (car next)) (look)) '(You cannot go that way))))

(defun pickup (object) (cond ((member object (objects-at *location* *object-locations*)) (push `(body ,(list object)) *object-locations*) '(You are now carrying the object.)) (t '(You cannot pickup that object.))))

(defparameter *inventory* '())

(defun inventory () (cond ((assoc 'body *object-locations*) (push (cdr (assoc 'body *object-locations*)) *inventory*))) (append '(Items-) *inventory*))
