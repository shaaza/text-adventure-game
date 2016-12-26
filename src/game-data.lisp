;; Here we store the initial scene graph of the game, which can be altered during run-time.
;; We will store the places and navigation through the game in the form of an adjacency list, representing an undirected graph.
;; Adjacency lists are well-suited for representing sparse graphs, and allow to be searched easily.
;; The A-list has the following components:
;; 1. A list of nodes, along with their descriptions.
;; 2. A list of edges incident to or going out from each node.
;;
;; We also maintain a list of objects that can be found at each node of the scene graph.


;; Nodes (or Places and Scenery) (Scene graph)
; @type Global Variable
; @desc Store location and desc as alists.(nodes)

(defparameter *nodes*
                      '((garden (There is a beautiful garden))
                       (living-room (There is an old man sleeping on the couch))
                       (attic (There is a lot of dust and mangoes))))


;; Edges (or Paths)
; @type Global variable
; @desc Store location and path (to-location direction path-portal) as alists.

(defparameter *edges* '((garden (living-room west door))
                        (living-room (attic north ladder)
                                     (garden east door  ))
                        (attic (living-room south ladder))))

;; Objects
; @type Global Variable
; @desc Objects and object locations

(defparameter *objects*
              '(whiskey bucket mop toy))

(defparameter *object-locations*
                                 '((living-room (whiskey))
                                   (garden (mop) (bucket))
                                   (attic (toy))))
