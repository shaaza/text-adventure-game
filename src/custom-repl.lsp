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