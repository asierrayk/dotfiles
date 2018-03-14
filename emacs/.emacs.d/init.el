(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages (quote (auto-virtualenv elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)
(package-initialize)

(elpy-enable)

(add-to-list 'package-archives
     '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'load-path "~/.dotfiles/emacs/packages/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


;; BASIC CUSTOMIZATION
;; --------------------------------------

(global-linum-mode t) ;; enable line numbers globally


;; MAPPINGS CUSTOMIZATION
;; --------------------------------------
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
