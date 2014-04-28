(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs-auto-save/.emacs-saved-places")
(setq backup-directory-alist
      '((".*" . "~/.emacs-auto-save/backup-files/"))
      )
(setq auto-save-list-file-prefix "~/.emacs-auto-save/auto-save-list/.saves-") 
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs-auto-save/auto-save-files/" t))
      )

(global-set-key (kbd "<f6>") 'kill-this-buffer) ; Close file

(defun next-user-buffer ()
  "Switch to the next user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(defun next-emacs-buffer ()
  "Switch to the next emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-emacs-buffer ()
  "Switch to the previous emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(define-key global-map [(ctrl up)] 'beginning-of-buffer)
(define-key global-map [(ctrl down)] 'end-of-buffer)
(define-key global-map [(ctrl left)] 'previous-user-buffer)
(define-key global-map [(ctrl right)] 'next-user-buffer)

(require 'smooth-scrolling)
