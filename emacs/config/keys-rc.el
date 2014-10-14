;; cedet

(defun my-cedet-hook ()
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "C-<up>") 'senator-previous-tag)
  (local-set-key (kbd "C-<down>") 'senator-next-tag)
)
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)
(add-hook 'python-mode-hook 'my-cedet-hook)


(defun alexott/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

;; ecb
(global-set-key [f3] 'ecb-activate)
(global-set-key [f7] 'ecb-toggle-compile-window)
(global-set-key (kbd "M-<kp-enter>") 'ecb-toggle-ecb-windows)
(global-set-key (kbd "M-<kp-divide>") 'ecb-goto-window-edit1)
(global-set-key (kbd "M-<kp-multiply>") 'ecb-goto-window-directories)
(global-set-key (kbd "M-<kp-subtract>") 'ecb-goto-window-methods)
(global-set-key (kbd "M-<kp-decimal>") 'ecb-goto-window-history)
(global-set-key (kbd "M-<kp-add>") 'ecb-goto-window-compilation)

;; auto-complete

(define-key ac-mode-map [(meta return)] 'auto-complete)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)

;; windows

;; easy keys to split window. Key based on ErgoEmacs keybinding
(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") 'split-window-horizontally) ; split pane left/right
(global-set-key (kbd "M-5") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-2") 'delete-window) ; close current pane
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
(global-set-key (kbd "C-:") 'iedit-dwim)
;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(global-set-key (kbd "<f8>") 'execute-extended-command)

;; programming

(global-set-key [f4] 'compile)
(global-set-key (kbd "M-[") 'align-comments)


;; shell
(global-set-key [f1] 'shell)
