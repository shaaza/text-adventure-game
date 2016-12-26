;; Here we maintain the variables that track the states of the player.

; @func Global Variable
; @desc Where the player is. This is simply the name of the node in the scene graph which the player visits.
(defparameter *location* 'living-room)

; @func Global Variable
; @desc The objects that the player is carrying. 
(defparameter *inventory* '())
