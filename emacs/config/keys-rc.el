;; helm

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>") 'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n") 'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p") 'helm-grep-mode-jump-other-window-backward)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
;;(global-set-key (kbd "C-c h o") 'helm-occur)

(global-set-key (kbd "C-c h x") 'helm-register)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; show minibuffer history with Helm
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

(define-key global-map [remap find-tag] 'helm-etags-select)

(define-key global-map [remap list-buffers] 'helm-buffers-list)

;; rebind useless C-x C-r to helm-recentf
(global-set-key (kbd "C-x C-r") 'helm-recentf)

;; helm-swoop

;; Change the keybinds to whatever you like :)
(global-set-key (kbd "C-c h o") 'helm-swoop)
(global-set-key (kbd "C-c s") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; helm-gtags

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; function-args keymap changes
;(define-key function-args-mode-map (kbd "M-o") nil)
;(define-key function-args-mode-map (kbd "M-n") nil)


;; helm-semantic-autocomplete-etc
(global-set-key (kbd "M-<return>") 'company-complete)
(defun my-c-mode-semantic-hook ()
  (local-set-key "\C-ce" 'helm-semantic)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-r" 'semantic-symref)
)
(add-hook 'c-mode-common-hook 'my-c-mode-semantic-hook)

;; ecb

(global-set-key [f3] 'ecb-activate)
(global-set-key [f7] 'ecb-toggle-compile-window)
(global-set-key (kbd "M-<kp-enter>") 'ecb-toggle-ecb-windows)
(global-set-key (kbd "M-<kp-divide>") 'ecb-goto-window-edit1)
(global-set-key (kbd "M-<kp-multiply>") 'ecb-goto-window-directories)
(global-set-key (kbd "M-<kp-subtract>") 'ecb-goto-window-methods)
(global-set-key (kbd "M-<kp-delete>") 'ecb-goto-window-history)
(global-set-key (kbd "M-<kp-add>") 'ecb-goto-window-compilation)

;; windows

;; easy keys to split window. Key based on ErgoEmacs keybinding
(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") (lambda () (interactive) (split-window-horizontally) (balance-windows))) ; split pane left/right
(global-set-key (kbd "M-5") (lambda () (interactive) (split-window-vertically) (balance-windows))) ; split pane top/bottom
(global-set-key (kbd "M-2") (lambda () (interactive) (delete-window) (balance-windows))) ; close current pane
(global-unset-key (kbd "M-o"))
(global-set-key (kbd "M-o") 'other-window) ; cursor to other pane
(global-set-key (kbd "M-f") 'other-frame) ; cursor to other frame

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)


;; buffer
(define-key global-map [(ctrl left)] 'previous-user-buffer)
(define-key global-map [(ctrl right)] 'next-user-buffer)
(global-set-key (kbd "C-,") 'push-mark-no-activate)
(global-set-key (kbd "C-.") 'jump-to-mark)
(global-set-key [f2] 'rgrep)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key [f5] 'revert-this-buffer)
(global-set-key (kbd "<f6>") 'kill-this-buffer) ; Close file
(global-set-key (kbd "C-<f2>") 'multi-occur-in-this-mode) 

;; general editing

(define-key global-map [(meta right)] 'forward-word)
(define-key global-map [(meta left)] 'backward-word)
(define-key global-map [(meta down)] 'forward-paragraph)
(define-key global-map [(meta up)] 'backward-paragraph)
;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "<f8>") 'execute-extended-command)

;; programming

(global-set-key [f4] 'compile)
(global-set-key (kbd "M-]") 'align-current)
(global-set-key (kbd "M-[") 'align-comments)



(global-set-key (kbd "C-x r SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)


(global-set-key [remap query-replace] 'anzu-query-replace)
(global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
