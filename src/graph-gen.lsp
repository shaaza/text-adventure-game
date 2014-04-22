;; Convert nodes to dot format
(defun nodes->dot (nodes)
       (when nodes
	         (let ((item (car nodes))
			       (rest (cdr nodes)))
				   (princ "digraph {")
				   (princ (car item))
				   (princ

;; Convert edges to dot format


;; Combine the above two:  nodes and edges to dot format


;; Write to file and execute graphviz to create png

