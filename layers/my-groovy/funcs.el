;;; funcs.el --- my-groovy layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 rgb-24bit
;;
;; Author:  rgb-24bit <rgb-24bit@foxmail.com>
;; URL: https://github.com/rgb-24bit/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defun spacemacs/groovy-send-region-switch (start end)
  "Send region content to REPL and switch to it in insert mode."
  (interactive "r")
  (groovy-send-region-and-go start end)
  (evil-insert-state))

(defun spacemacs/groovy-send-definition-switch ()
  "Send function content to REPL and switch to it in insert mode."
  (interactive)
  (groovy-send-definition-and-go)
  (evil-insert-state))

(defun spacemacs/groovy-load-file ()
  "Save buffer, load it to REPL."
  (interactive)
  (save-buffer)
  (groovy-load-file (buffer-file-name)))

(defun spacemacs/groovy-load-file-switch ()
  "Save buffer, load buffer to REPL and switch to it in insert mode."
  (interactive)
  (spacemacs/groovy-load-file)
  (switch-to-groovy nil)
  (evil-insert-state))
