;; Windows ;;

(if (functionp 'menu-bar-mode) (menu-bar-mode 0))
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))
(if (functionp 'scroll-bar-mode) (scroll-bar-mode 0))

(require 'spaceline-config)
(spaceline-spacemacs-theme)
(spaceline-helm-mode +1)
(setq spaceline-anzu-p t)
(setq spaceline-minor-modes-p nil)

(global-anzu-mode +1)


