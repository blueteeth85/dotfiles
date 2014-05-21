(global-set-key (kbd "<f8>") 'execute-extended-command)

;; General Editing ;;

(setq delete-selection-mode 1)
(setq kill-whole-line 1)
(setq tab-always-indent 1)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(define-key global-map [(meta right)] 'forward-word)
(define-key global-map [(meta left)] 'backward-word)
(define-key global-map [(meta down)] 'forward-paragraph)
(define-key global-map [(meta up)] 'backward-paragraph)

(unless window-system
  (add-hook 'linum-before-numbering-hook
	        (lambda ()
		        (setq-local linum-format-fmt
				      (let ((w (length (number-to-string
							    (count-lines (point-min) (point-max))))))
					    (concat "%" (number-to-string w) "d"))))))

(defun linum-format-func (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   (propertize " " 'face 'mode-line)
   )
  )

(unless window-system
  (setq linum-format 'linum-format-func))

(global-linum-mode 1)
(global-visual-line-mode 1)

;; don't let the cursor go into minibuffer prompt
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

;; Color theme ;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/my-packages/emacs-color-theme-solarized")
;(load-theme 'solarized-dark t)

