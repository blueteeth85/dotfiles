(require 'doxymacs)

(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (doxymacs-mode 1)
	     (doxymacs-font-lock)
	     (setq doxymacs-doxygen-style "C++")))

(add-hook 'python-mode-hook
          '(lambda ()
             (doxymacs-mode 1)
             (doxymacs-font-lock)
             (setq doxymacs-doxygen-style "python")))




