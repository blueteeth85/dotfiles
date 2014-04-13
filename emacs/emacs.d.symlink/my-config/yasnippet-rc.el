(add-to-list 'load-path "~/.emacs.d/my-packages/yasnippet")
(require 'yasnippet)

(yas--initialize)
(yas/load-directory "~/.emacs.d/my-packages/yasnippet/snippets")

