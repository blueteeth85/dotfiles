(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

(require 'helm)
(require 'helm-config)
(require 'helm-grep)
(require 'helm-gtags)


;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-common-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)


(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-buffers-fuzzy-matching           t
      helm-semantic-fuzzy-match             t
      helm-autoresize-max-height            30
      helm-autoresize-min-height            30)

(helm-autoresize-mode t)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

(require 'helm-swoop)

(setq helm-multi-swoop-edit-save t)
(setq helm-swoop-split-with-multiple-windows t)
(setq helm-swoop-split-direction 'split-window-vertically)
(setq helm-swoop-speed-or-color t)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(helm-mode 1)

;; company mode
(require 'company)
(add-to-list 'company-backends 'company-c-headers)
(add-hook 'after-init-hook 'global-company-mode)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)


(add-to-list 'projectile-other-file-alist '("cc" "h" "hpp" "hh"))
(add-to-list 'projectile-other-file-alist '("h" "c" "cpp" "cc"))

(require 'eassist)
(setq-default ecb-tip-of-the-day nil)
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 12)
(setq ecb-fix-window-size 'width)
(setq ecb-layout-name "my-right-analyse-2")
;;(ecb-activate)
;;(ecb-hide-ecb-windows)
;;(ecb-toggle-compile-window)
