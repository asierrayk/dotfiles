;;; package --- summary

;;; Commentary:

;;; Code:


;;(defvar moves (?B ?D ?F ?L ?R ?U))

(defun move-cw (move)
  "Write clockwise MOVE."
  (interactive)
  (if (= (char-before (point)) move)
      (insert "2")
    (if (and (= (char-before (point)) ?\')
	     (= (char-before (- (point) 1)) move))
	 (backward-delete-char 2)
      (if (and (= (char-before (point)) ?2)
	       (= (char-before (- (point) 1)) move))
	  (progn
	    (backward-delete-char 1)
	   (insert "'"))
	(insert move)
	 )
      )
    )
  )

(defun move-acw (move)
  "Write anti-clockwise MOVE."
  (interactive)
  (if (= (char-before (point)) move)
      (backward-delete-char 1)
    (if (and (= (char-before (point)) ?\')
	     (= (char-before (- (point) 1)) move))
	(progn
	  (backward-delete-char 1)
	  (insert "2"))
      (if (and (= (char-before (point)) ?2)
	       (= (char-before (- (point) 1)) move))
	  (backward-delete-char 1)
	(progn
	  (insert move)
	  (insert "'")
	 )
	 )
      )
    )
  )

(defun R ()
  "R."
  (interactive)
  (move-cw ?R)
  )

(defun Rp ()
  "R'."
  (interactive)
  (move-acw ?R))

(defun L ()
  "L."
  (interactive)
  (move-cw ?L))

(defun Lp ()
  "L'."
  (interactive)
  (move-acw ?L))

(defun U ()
  "U."
  (interactive)
  (move-cw ?U))

(defun Up ()
  "U'."
  (interactive)
  (move-acw ?U))

(defun F ()
  "F."
  (interactive)
  (move-cw ?F))

(defun Fp ()
  "F'."
  (interactive)
  (move-acw ?F))

(defun B ()
  "B."
  (interactive)
  (move-cw ?B))


(defun Bp ()
  "B'."
  (interactive)
  (move-acw ?B))

(defun D ()
  "D."
  (interactive)
  (move-cw ?D))

(defun Dp ()
  "D'."
  (interactive)
  (move-acw ?D))



;;;###autoload
(define-minor-mode rubik-mode
  "Rubik mode."
  ;; The initial value - Set to 1 to enable by default
  nil
  ;; The indicator for the mode line.
  " RubikMode"
  ;; The minor mode keymap
  `(
    (,(kbd "i") . R)
    (,(kbd "k") . Rp)
    (,(kbd "d") . L)
    (,(kbd "e") . Lp)
    (,(kbd "h") . F)
    (,(kbd "g") . Fp)
    (,(kbd "j") . U)
    (,(kbd "f") . Up)
    (,(kbd "w") . B)
    (,(kbd "o") . Bp)
    (,(kbd "s") . D)
    (,(kbd "l") . Dp)
   )
   ;; Make mode global rather than buffer local
   ;;:global 1
)

;;;###autoload
;;(add-hook 'text-mode-hook 'foo-mode)

(provide 'rubik)
;;; rubik-mode.el ends here
