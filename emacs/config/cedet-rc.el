;; semantic
 
;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)

(semantic-mode 1)
(require 'semantic/ia)

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)


(global-ede-mode t)


;; eassist
(require 'eassist)

;; ecb

(setq-default ecb-tip-of-the-day nil)
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 12)
(setq ecb-fix-window-size 'width)
(setq ecb-layout-name "my-right")
;(ecb-activate)
;(ecb-hide-ecb-windows)
;(ecb-toggle-compile-window)

;; auto-complete
(ac-config-default)

(global-auto-complete-mode)
(setq ac-auto-start nil)
(setq ac-use-menu-map t)
(setq ac-menu-height 20)

(defun my-c-mode-ac-hook ()
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my-c-mode-ac-hook)
