(load "../vendor/lisp-unit.lisp")


;;; Game

(load "../src/game.lisp")

;; describe-location
;; 'key, 'a-list -> '(value)
(lisp-unit:define-test describe-location
                       (lisp-unit:assert-equal '(value) 
                       						   (describe-location 'key '((key (value))
                                                                         (key1 (value1))))
                       ))

;; describe-path
;; ['(location direction mode-of-movt)'] -> ['(Generated Sentence)]
(lisp-unit:define-test describe-path
                       (lisp-unit:assert-equal '(There is a door going north from here) 
                       							(describe-path '(living-room north door))
                       ))