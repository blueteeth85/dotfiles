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
  (c-set-offset 'comment-intro '0)
  (setq c-basic-offset 2)
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  )

(add-hook 'c++-mode-hook 'vlad-cc-style)

(defun my-perl-style()
  (setq cperl-extra-newline-before-brace t)
  (setq cperl-indent-parens-as-block t)
  (setq cperl-brace-offset -2)
  (setq cperl-merge-trailing-else nil)
  )

(add-hook 'cperl-mode-hook 'my-perl-style)

(add-hook 'prog-mode-hook 'highlight-parentheses-mode)

;; enable CamelCase mode for all programming modes
(add-hook 'prog-mode-hook 'subword-mode)

(defadvice subword-backward (before handle-shift-selection activate)
  (handle-shift-selection))

(defadvice subword-forward (before handle-shift-selection activate)
  (handle-shift-selection))

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


(defun align-comments()
  (interactive)
  (setq current-prefix-arg '(4)) ; C-u
  (call-interactively 'comment-set-column))


(eval-when-compile
  (require 'cl))

(defun get-buffers-matching-mode (mode)
  "Returns a list of buffers where their major-mode is equal to MODE"
  (let ((buffer-mode-matches '()))
   (dolist (buf (buffer-list))
     (with-current-buffer buf
       (if (eq mode major-mode)
           (add-to-list 'buffer-mode-matches buf))))
   buffer-mode-matches))

(defun multi-occur-in-this-mode ()
  "Show all lines matching REGEXP in buffers with this major mode."
  (interactive)
  (multi-occur
   (get-buffers-matching-mode major-mode)
   (car (occur-read-primary-args))))


(fa-config-default)


(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

