;; Requires use-package

;; Basics

(setq user-emacs-directory "~/.emacs.d")
(require 'package)
(require 'use-package)

(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq backup-directory-alist '(("." . "~/.emacs_saves")))

(if (file-exists-p "~/.emacs.d/splash.png")
    (setq fancy-splash-image "~/.emacs.d/splash.png"))

(set-frame-font "Monospace-12")

(recentf-mode 1)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 10)

(global-display-line-numbers-mode)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(fset 'yes-or-no-p 'y-or-n-p)

(setq compilation-scroll-output t)

(setq split-width-threshold nil)
(setq split-height-threshold 0)

(setq scroll-conservatively 10)
(setq scroll-margin 7)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "librewolf")

;; (setenv "HOME" "/home/anon")

;;(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

;; Coding

(setq-default c-basic-offset 4)
(setq-default c-default-style "bsd")

(electric-pair-mode 1)

;; Packages

(use-package gruber-darker-theme
  :ensure t)

(use-package org
  :ensure t)

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (setq evil-leader/no-prefix-mode-rx '("magit-.*-mode" "gnus-.*-mode")))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-insert-state-cursor 'box
	evil-normal-state-cursor 'box))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

(use-package which-key
    :config
    (setq which-key-idle-delay 0.3)
    (setq which-key-popup-type 'frame)
    (which-key-mode)
    (which-key-setup-minibuffer)
    (set-face-attribute 'which-key-local-map-description-face nil
	:weight 'bold)
    :ensure t)

(use-package org-superstar
  :ensure t
  :config
  (setq org-startup-indented t)
  (setq org-startup-with-inline-images t)
  (add-hook 'org-mode-hook
	    (lambda () (org-superstar-mode 1))))
  
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

(use-package smex
  :ensure t
  :config
  (smex-initialize))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package company
  :ensure t
  :config
  (setq company-dabbrev-ignore-case t)
  ;; (setq company-idle-delay 0)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package vterm
  :ensure t
  :config
  (add-hook 'vterm-mode-hook
	    (lambda()
	      (evil-insert-state)
	      (read-only-mode -1)
	      (evil-local-set-key 'normal "p" 'vterm-yank))))

(use-package elfeed
  :ensure t
  :config
  (add-to-list 'evil-emacs-state-modes 'elfeed-search-mode)
  (add-to-list 'evil-emacs-state-modes 'elfeed-show-mode)
  (setq elfeed-feeds
	'(("https://nitter.net/39daph/rss" twitter)
	  ("https://nitter.net/Erobb221/rss" twitter))))

(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))


;; Keybinds and functions

(defun mini-terminal ()
  "Opens a vterm buffer in a split below the window."
  (interactive)
  (split-window-vertically)
  (window-swap-states)
  (vterm))

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "."  'dired
  "c"  'compile
  "bb" 'previous-buffer
  "bn" 'next-buffer
  "wv" 'split-window-horizontally
  "ws" 'split-window-vertically
  "wc" 'delete-window
  "ww" 'other-window
  "ff" 'find-file
  "fr" 'recentf-open-files
  "fb" 'switch-to-buffer
  "bi" 'ibuffer
  "bk" 'kill-buffer
  "ot" 'mini-terminal
  "oT" 'vterm
  "el" 'elfeed)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;;; .emacs ends here
