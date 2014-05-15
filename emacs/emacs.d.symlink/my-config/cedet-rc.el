(load-file "~/.emacs.d/my-packages/cedet/cedet-devel-load.el")
(add-to-list 'load-path "~/.emacs.d/my-packages/cedet/contrib/")
(add-to-list  'Info-directory-list "~/.emacs.d/my-packages/cedet/doc/info")

;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

;(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)

;; Activate semantic
(semantic-mode 1)

(require 'semantic/ia)
(require 'semantic/bovine/gcc)

(semantic-add-system-include "/usr/include/boost" 'c++-mode)

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)


 
;; customisation of modes
(defun blueteeth/cedet-hook ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "M-<up>") 'senator-previous-tag)
  (local-set-key (kbd "M-<down>") 'senator-next-tag)
  )

(add-hook 'c-mode-common-hook 'blueteeth/cedet-hook)

;; load contrib library
(require 'eassist)

(defun blueteeth/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'blueteeth/c-mode-cedet-hook)
 
