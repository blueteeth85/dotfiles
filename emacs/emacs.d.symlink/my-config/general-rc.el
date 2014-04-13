(global-set-key (kbd "<f8>") 'execute-extended-command)

;; General Editing ;;

(setq delete-selection-mode 1)
(setq kill-whole-line 1)
(setq tab-always-indent 1)
(setq indent-tabs-mode nil)
(setq tab-width 8)
(global-hl-line-mode 1)
(define-key global-map [(meta right)] 'forward-word)
(define-key global-map [(meta left)] 'backward-word)
(define-key global-map [(meta down)] 'forward-paragraph)
(define-key global-map [(meta up)] 'backward-paragraph)


;; Color theme ;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/my-packages/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)
