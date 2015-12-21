;; General Editing ;;

(setq delete-selection-mode 1)
(setq kill-whole-line 1)
(setq tab-always-indent 1)
(setq indent-tabs-mode nil)
(setq tab-width 4)

(global-visual-line-mode 1)

;; don't let the cursor go into minibuffer prompt
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

;; Color theme ;;

(load-theme 'solarized-light t)

;; enable recent files mode.
(recentf-mode t)

; 50 files ought to be enough.
(setq recentf-max-saved-items 50)



