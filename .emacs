;; Requires manual install use-package
;; Change to your .emacs.d/ directory accordingly
(setq user-emacs-directory "/home/anon/.emacs.d")
(require 'package)
(require 'use-package)

(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Hide Scroll bar,menu bar, tool bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
;; (setq inhibit-splash-screen t)

;; If there is no splash screen file, just remove the splash screen
(if (file-exists-p "~/.emacs.d/splash.png")
    (setq fancy-splash-image "~/.emacs.d/splash.png")
  (setq inhibit-splash-screen t))

;; Set indent level for c/c++
(setq-default c-basic-offset 4)

;; Automatically refresh buffers
(global-auto-revert-mode t)

;; Change indent style
(setq-default c-default-style "bsd"
      c-basic-offset 4)

;; Fonts
(set-frame-font "Monospace-12")
;; (set-frame-font "Iosevka Nerd Font-15")

;; Set backkup dirs
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;; Line numbering
(global-display-line-numbers-mode)

;; Make escape only need 1 press instead of 3
(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

;; Keybindings
;;(global-set-key (kbd "<f5>") 'revert-buffer)
;;(global-set-key (kbd "<f3>") 'org-export-dispatch)

;; Misc stuff
(fset 'yes-or-no-p 'y-or-n-p)
(setenv "HOME" "/home/anon")

;; Custom commands and functions
(defun mini-terminal ()
  "Opens a vterm buffer in a split below the window."
  (interactive)
  (split-window-vertically)
  (window-swap-states)
  (vterm))

;; Kill compilation buffer if success
(add-hook 'compilation-finish-functions
  (lambda (buf str)
    (if (null (string-match ".*exited abnormally.*" str))
        ;;no errors, make the compilation window go away in a few seconds
        (progn
          (run-at-time
           "0.5 sec" nil 'delete-windows-on
           (get-buffer-create "*compilation*"))
          (message "No Compilation Errors!")))))   

(use-package gruber-darker-theme
  :ensure t)

(use-package org
  :ensure t)

(use-package evil-leader
  :ensure t)

(require 'evil-leader)
(global-evil-leader-mode)
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
  "fb" 'switch-to-buffer
  "bi" 'ibuffer
  "bk" 'kill-buffer ;; :q kills buffer and window like vim
  ;;"bk" 'kill-buffer-and-window
  "ot" 'mini-terminal
  "oT" 'vterm
  "el" 'elfeed
  "ec" (lambda() (interactive) (find-file "~/.emacs")))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(elfeed-feeds nil)
 '(package-selected-packages
   '(evil-commentary emojify elfeed company evil-leader magit vterm smex markdown-mode which-key flycheck evil use-package))
 '(warning-suppress-types '((emacs) (emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Evil mode vim comments
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

(use-package markdown-mode
    :ensure t
    :mode (("README\\.md\\'" . gfm-mode)
	   ("\\.md\\'" . markdown-mode)
	   ("\\.markdown\\'" . markdown-mode))
    :init (setq markdown-command "multimarkdown"))

(use-package org-superstar  ;; Improved version of org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))
  
(setq org-startup-indented t)           ;; Indent according to section
(setq org-startup-with-inline-images t) ;; Display images in-buffer by default(setq ido-everywhere t)

(setq ido-enable-flex-matching t)
(ido-mode t)

(use-package smex
  :ensure t
  :config (smex-initialize))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; Using company now, comment company and uncomment this for auto-complete
;;(use-package auto-complete
;;  :ensure t
;;  :config
;;  (ac-config-default))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;; Set cursor to box
(setq evil-insert-state-cursor 'box
      evil-normal-state-cursor 'box)

;; Set horizontal split only
(setq split-width-threshold nil)
(setq split-height-threshold 0)

;; Set auto close paris
(electric-pair-mode 1)

;; Change zoom in keybinds and zoom everywhere
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(use-package magit
  :ensure t)

(use-package vterm
  :ensure t
  :config
  ;; Disable read only mode on buffer so pase work
  (add-hook 'vterm-mode-hook
	    (lambda()
	      (read-only-mode -1)
	      (evil-local-set-key 'normal "p" 'vterm-yank))))

;; Set normal line scroll
(setq scroll-conservatively 10)
(setq scroll-margin 7)

(use-package elfeed
  :ensure t)

;; Somewhere in your .emacs file
(setq elfeed-feeds
      '(("https://nitter.net/yuniruyuni/rssi" twitter)
	("https://nitter.net/sudobunni/rss" twitter)
	("https://nitter.net/ThePrimeagen/rss" twitter)
	;; ("https://nitter.net/Aeyga_X/rss" twitter)
	("https://inv.vern.cc/feed/channel/UCVls1GmFKf6WlTraIb_IaJg" youtube)
	("https://inv.vern.cc/feed/channel/UC7YOGHUfC1Tb6E4pudI9STA" youtube)
	("https://inv.vern.cc/feed/channel/UCsvn_Po0SmunchJYOWpOxMg" youtube)
	("https://inv.vern.cc/feed/channel/UC2eYFnH61tmytImy1mTYvhA" youtube)
	("https://inv.vern.cc/feed/channel/UCPElDASDYyOeNAZbbTCdOUw" youtube)
	("https://inv.vern.cc/feed/channel/UCOBXQF0RKsxYIBNRxI4kPSg" youtube)
	("https://inv.vern.cc/feed/channel/UCrqM0Ym_NbK1fqeQG2VIohg" youtube)
	("https://inv.vern.cc/feed/channel/UC9H0HzpKf5JlazkADWnW1Jw" youtube)
	("https://inv.vern.cc/feed/channel/UC8ENHE5xdFSwx71u3fDH5Xw" youtube)
	("https://inv.vern.cc/feed/channel/UCUyeluBRhGPCW4rPe_UvBZQ" youtube)
	("https://inv.vern.cc/feed/channel/UCXEJNKH9I4xsoyUNN3IL96A" youtube)))

;; Keep evil mode from interfeering with elfeed mode
(add-to-list 'evil-emacs-state-modes 'elfeed-search-mode)
(add-to-list 'evil-emacs-state-modes 'elfeed-show-mode)

;; Set default browser to eww for rss
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "librewolf")

;; Emojis
(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

;; Transparency
;;(set-frame-parameter (selected-frame) 'alpha '(95 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (95 . 50)))
