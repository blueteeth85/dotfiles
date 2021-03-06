
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(setq inhibit-startup-message t)


;; load all packages through cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'load-path "~/.emacs.d/site-lisp")

(setq redisplay-dont-pause t)

(setq shell-file-name "bash")
(setq shell-command-switch "-c")

;; useful for emacsclient

(add-hook 'server-switch-hook
	  (lambda ()
	    (when (current-local-map)
	      (use-local-map (copy-keymap (current-local-map))))
	    (when server-buffer-clients
	      (local-set-key (kbd "<f1>") 'server-edit)
	      )
	    )
	  )


;; Basic config ;;
(load "~/.emacs.d/config/window-rc.el")
(load "~/.emacs.d/config/frame-rc.el")
(load "~/.emacs.d/config/modeline-rc.el")
(load "~/.emacs.d/config/buffer-rc.el")

;; Editing ;;
(load "~/.emacs.d/config/general-rc.el")
(load "~/.emacs.d/config/prog-rc.el")

;; Load other packages' config;;
(load "~/.emacs.d/config/helm-rc.el")
(load "~/.emacs.d/config/doxymacs-rc.el")
(load "~/.emacs.d/config/ispell-rc.el")
(load "~/.emacs.d/config/perl-rc.el")
(load "~/.emacs.d/config/yasnippet-rc.el")
(load "~/.emacs.d/config/auctex-rc.el")

(load "~/.emacs.d/config/shell-rc.el")

;; keybindings
(load "~/.emacs.d/config/keys-rc.el")

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq ediff-split-window-function (if (> (frame-width) 150) 'split-window-horizontally 'split-window-vertically))

(load-file "~/.emacs.d/site-lisp/emacs-flow-jsx-mode.el")

(load "~/.localemacs")

(load custom-file)
