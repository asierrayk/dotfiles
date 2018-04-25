;;; package --- summary

;;; Commentary:

;;; Code:
(make-variable-buffer-local
 (defvar rubik-r 0
   "Number R moves."))

(defun R ()
  "R."
  (interactive)
  (setq rubik-r (1+ rubik-r))
  (insert "R"))

(defun Rp ()
  "R'."
  (interactive)
  (setq rubik-r (1+ rubik-r))
  (insert "R'"))

(defun L ()
  "L."
  (interactive)
  (insert "L"))

(defun Lp ()
  "L'."
  (interactive)
  (insert "L"))

(defun U ()
  "U."
  (interactive)
  (insert "U"))

(defun Up ()
  "U'."
  (interactive)
  (insert "U'"))

(defun F ()
  "F."
  (interactive)
  (insert "F"))

(defun Fp ()
  "F'."
  (interactive)
  (insert "F'"))

(defun B ()
  "B."
  (interactive)
  (insert "B"))


(defun Bp ()
  "B'."
  (interactive)
  (insert "B'"))

(defun D ()
  "D."
  (interactive)
  (insert "D"))

(defun Dp ()
  "D'."
  (interactive)
  (insert "D'"))



;;;###autoload
(define-minor-mode rubik-mode
  "Rubik mode."
  ;; The initial value - Set to 1 to enable by default
  nil
  ;; The indicator for the mode line.
  " CustomMode"
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
