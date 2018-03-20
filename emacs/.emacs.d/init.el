; list the packages you want
(setq package-list '(projectile
		     auto-complete
		     epc
		     jedi
		     elpy
		     epc))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (resize-window tabbar org-bullets which-key use-package try projectile jedi elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;START INIT FILE
(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


;; USE PACKAGE
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))


;; ORG MODE
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; IDO MODE
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; TAB BAR
(use-package tabbar
  :ensure t
  :config (tabbar-mode 1))


;; WINDOW STUFF
(winner-mode 1)

(use-package resize-window
  :ensure t)


; add this to init.el
;(use-package ace-window
;  :ensure t
;  :init
;  (progn
;    (global-set-key [remap other-window] 'ace-window)
;    (custom-set-faces
;     '(aw-leading-char-face
;       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
;    ))
