;;; Basics

(setq user-emacs-directory "~/.emacs.d")
(require 'package)
(require 'use-package)

(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(if (file-exists-p "~/.emacs.d/splash.png")
    (setq fancy-splash-image "~/.emacs.d/splash.png"))

(setq backup-directory-alist '(("." . "~/.emacs_saves")))

(set-frame-font "Liberation Mono-12")

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

;;; Coding

(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (other . "bsd")))
(electric-pair-mode 1)

;;; Packages and other settings

;; Theme
(use-package gruber-darker-theme
  :ensure t)

;; Evil setup
(setq evil-want-keybinding nil) ;; Evil collection

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq evil-insert-state-cursor 'box
	evil-normal-state-cursor 'box))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

;; Which key
(use-package which-key
    :config
    (setq which-key-idle-delay 0.3)
    (setq which-key-popup-type 'frame)
    (which-key-mode)
    (which-key-setup-minibuffer)
    (set-face-attribute 'which-key-local-map-description-face nil
	:weight 'bold)
    :ensure t)

;; Helm or Ido
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

;; Dired
(use-package dired+
  :load-path "~/.emacs.d/packages/dired+"
  :config
  (toggle-diredp-find-file-reuse-dir 1))

;; Smex
(use-package smex
  :ensure t
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;; Flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; Company
(use-package company
  :ensure t
  :config
  (setq company-dabbrev-ignore-case t)
  ;; (setq company-idle-delay 0)
  (add-hook 'after-init-hook 'global-company-mode))

;;; Keybinds

;; Evil leader keybinds
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
  "bk" 'kill-buffer)

;; Zoom
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(package-selected-packages
   '(dired+ company flycheck smex which-key evil-commentary evil-collection evil-leader gruber-darker-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
