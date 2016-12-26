;; Load the scene graph and other game world data.
(load "src/game-data.lisp")

;; Load functions which describe the game world, given the scene graph.
(load "src/scene-descriptors.lisp")

;; Load global variables which track the player's state and the game state.
(load "src/game-state.lisp")

;; Load functions which correspond to the UI actions, i.e. how the user can interact with the world.
(load "src/game-uis.lisp")

;; Load the REPL and other functions which stitch everything together.
(load "src/main.lisp")
