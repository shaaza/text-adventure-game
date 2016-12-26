(load "game-data.lisp")
(load "scene-descriptors.lisp")
(load "game-state.lisp")
(load "game-uis.lisp")


;;; Game loop/pipeline:
; 1. REPL hosts game
; 2. game-read reads, parses and converts user input into understandable commands for game-eval
; 3. game-eval checks if command if permitted, executes it and passes the result onto gameprint
; 4. game-print formats text and displays it on screen, uses tweak-text for formatting

; @func game-repl
; @desc High level recursive game loop that calls game-read, game-eval and game-print (described above)
; @param:user-input-string The string that the user inputs, passed in by the read-line function.

(defun game-repl (user-input-string)
                (let ((cmd (game-read user-input-string)))
                     (unless (eq (car cmd) 'quit)
					                   (game-print (game-eval cmd *allowed-commands*))
                             (game-repl (read-line)))))


; @func game-read
; @mapping (String) -> (List with every item quoted, except the first)
; @desc Features: i) Convert commands to lisp code: parentheses, unstring, quote
; @param:input-line The string that the user inputs, passed in by the game-repl function.
; @example "walk east" -> (walk 'east)

(defun game-read (input-line)
        (let ((input input-line))
		    (cond
			    (input (let ((stringd (read-from-string (concatenate 'string "(" input ")"))))
					             (flet ((quote-it (x) (list 'quote x)))
								             (cons (car stringd)
                                   (mapcar #'quote-it (cdr stringd)))))))))


; @func game-eval
; @desc Checks if command is an allowed game-UI action, and executes it if yes.
; @mapping (Command, Set of allowed commands) -> (output when the command executes)

(defun game-eval (command allowed-commands)
                  (cond
				             ((member (car command) allowed-commands)
						                  (eval command))
                      (t '(i do not know that command.))))


; @func tweak-text
; @desc Helper function for game-print
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

; @func game-print
; @desc Recursive function that goes through a list and makes each symbol human-readable/printable.
; @spec Spaces: as is; Capitalize new line letters;  Lower case rest; Replace

(defun game-print (toprint)
        (princ (coerce (tweak-text (coerce (string-trim "()" (prin1-to-string toprint))
                                           'list)
                                   t
                                   nil)
						    'string))
		    (fresh-line))

; Run game
(game-repl (read-line))
