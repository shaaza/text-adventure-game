
;; Nodes (or Places and Scenery) (Scene graph)
; Variable: Store location and desc as alists.(nodes)

(defparameter *nodes* 
                      '((garden (There is a beautiful garden))
                       (living-room (There is an old man sleeping on the couch))
                       (attic (There is a lot of dust and mangoes))))					   
                       					   

;; Edges (or Paths)
; Variable: Store location and path (to-location direction path-portal) as alists.

(defparameter *edges* '((garden (living-room west door))
                        (living-room (attic north ladder)
                                     (garden east door  ))
                        (attic (living-room south ladder))))
										   
;; Objects
; Variables: Objects and object locations

(defparameter *objects* 
              '(whiskey bucket mop toy))

(defparameter *object-locations* 
                                 '((living-room (whiskey)) 
                                   (garden (mop) (bucket)) 
                                   (attic (toy))))
