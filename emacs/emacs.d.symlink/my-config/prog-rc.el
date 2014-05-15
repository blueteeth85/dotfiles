;; General Programming ;;

(show-paren-mode 1)
(setq show-paren-delay 0)


(defun vlad-cc-style()
  (c-set-style "linux")
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'label '*)
  (c-set-offset 'case-label '*)
  (c-set-offset 'access-label '/)
  (setq c-basic-offset 2)
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
)

(add-hook 'c++-mode-hook 'vlad-cc-style)

(add-to-list 'load-path "~/.emacs.d/my-packages/highlight-parentheses/")
(require 'highlight-parentheses)
(add-hook 'prog-mode-hook 'highlight-parentheses-mode)

;; enable CamelCase mode for all programming modes
(add-hook 'prog-mode-hook 'subword-mode)


;; Fontify comment markers to make them stand out more
(mapcar (lambda (mode)
          (font-lock-add-keywords 
           mode
           '(("\\(FIXME\\|XXX\\|TODO\\)" 1 'font-lock-warning-face prepend))
           )
          )
        '(fundamental-mode text-mode latex-mode html-mode emacs-lisp-mode
                           texinfo-mode c-mode c++-mode lisp-mode)
        )

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(setq compilation-scroll-output "first-error")
(global-set-key [f4] 'compile)
(global-set-key [f5] 'switch-to-buffer)
