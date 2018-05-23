;;; package --- summary

;;; Commentary:

;;; Code:


(defvar moves '(?B ?D ?F ?L ?R ?U))

(defun move-cw (move)
  "Write clockwise MOVE."
  (interactive)
  ; CASE 2
  (if (= (char-before (point)) move)
      (insert "2")
    ; CASE '
    (if (= (char-before (point)) ?\')
	(if (and
	     (= (char-before (- (point) 1)) ?2)
	     (= (char-before (- (point) 2)) move))
	    (progn
	      (backward-delete-char 2)
	      (insert "'"))
	  (if (= (char-before (- (point) 1)) move)
	      (backward-delete-char 2)
	    (insert move))
	)
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
    (if (= (char-before (point)) ?\')
	(if (and
	     (= (char-before (- (point) 1)) ?2)
	     (= (char-before (- (point) 2)) move))
	    (backward-delete-char 2)
	  (if (= (char-before (- (point) 1)) move)
	      (progn
		(backward-delete-char 1)
		(insert "2")
		(insert "'"))
	    (insert move "'")))
      (if (and (= (char-before (point)) ?2)
	       (= (char-before (- (point) 1)) move))
	  (backward-delete-char 1)
	(insert move "'")
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

(defun x ()
  "x."
  (interactive)
  (move-cw ?x))

(defun xp ()
  "x'."
  (interactive)
  (move-acw ?x))

(defun y ()
  "y."
  (interactive)
  (move-cw ?y))

(defun yp ()
  "y'."
  (interactive)
  (move-acw ?y))

(defun z ()
  "z."
  (interactive)
  (move-cw ?z))

(defun zp ()
  "z'."
  (interactive)
  (move-acw ?z))

(defun r ()
  "r."
  (interactive)
  (move-cw ?r))

(defun rp ()
  "r'."
  (interactive)
  (move-acw ?r))

(defun u ()
  "u."
  (interactive)
  (move-cw ?u))

(defun up ()
  "u'."
  (interactive)
  (move-acw ?u))

(defun l ()
  "l."
  (interactive)
  (move-cw ?l))

(defun lp ()
  "l'."
  (interactive)
  (move-acw ?l))

(defun d ()
  "d."
  (interactive)
  (move-cw ?d))

(defun dp ()
  "d'."
  (interactive)
  (move-acw ?d))

(defun M ()
  "M."
  (interactive)
  (move-cw ?M))

(defun Mp ()
  "M'."
  (interactive)
  (move-acw ?M))





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
    (,(kbd "y") . x)
    (,(kbd "t") . x)
    (,(kbd "n") . xp)
    (,(kbd "a") . y)
    (,(kbd ";") . yp)
    (,(kbd "p") . z)
    (,(kbd "q") . zp)
    (,(kbd "u") . r)
    (,(kbd "m") . rp)
    (,(kbd "r") . lp)
    (,(kbd "v") . l)
    (,(kbd ",") . u)
    (,(kbd "c") . up)
    (,(kbd ".") . Mp)
    (,(kbd "x") . Mp)
    (,(kbd "5") . M)
    (,(kbd "6") . M)
    (,(kbd "z") . d)
    (,(kbd "/") . dp)
   )
   ;; Make mode global rather than buffer local
   ;;:global 1
)

;;;###autoload
;;(add-hook 'text-mode-hook 'foo-mode)

(provide 'rubik)
;;; rubik-mode.el ends here
