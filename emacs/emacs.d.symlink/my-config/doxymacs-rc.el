(add-to-list 'load-path "~/.emacs.d/my-packages/doxymacs")
(require 'doxymacs)

(add-hook 'c-mode-common-hook 'doxymacs-mode)

(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

(custom-set-variables
 '(doxymacs-doxygen-style "Qt")
 )
