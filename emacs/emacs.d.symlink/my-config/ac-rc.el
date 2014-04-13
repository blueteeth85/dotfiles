(add-to-list 'load-path "~/.emacs.d/my-packages/auto-complete/lib/popup")    


(add-to-list 'load-path "~/.emacs.d/my-packages/auto-complete")    
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/my-packages/auto-complete/dict")

(require 'auto-complete-latex)

(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
(define-key ac-mode-map [(meta return)] 'auto-complete)


(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-semantic ac-source-yasnippet) ac-sources))
)

(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev 
			ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t)
)


(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
(my-ac-config)


