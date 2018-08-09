;;; funcs.el --- my-html layer packages file for Spacemacs.
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

(defun my-imp-visit-buffer ()
  "Visit the buffer in a browser."
  (interactive)
  (impatient-mode)
  (browse-url
   (format "http://%s:%d/imp/live/%s/"
           "localhost" httpd-port (url-hexify-string (buffer-name)))))

(defun spacemacs/impatient-mode ()
  (interactive)
  (if (bound-and-true-p impatient-mode)
      (impatient-mode -1)
    (unless (process-status "httpd")
      (httpd-start))
    (impatient-mode)
    (when (string-match-p "\\.html\\'" (buffer-name))
      (my-imp-visit-buffer))))

(defun spacemacs/css-expand-statement ()
  "Expand CSS block"
  (interactive)
  (save-excursion
    (end-of-line)
    (search-backward "{")
    (forward-char 1)
    (while (or (eobp) (not (looking-at "}")))
      (let ((beg (point)))
        (newline)
        (search-forward ";")
        (indent-region beg (point))
        ))
    (newline)))

(defun spacemacs/css-contract-statement ()
  "Contract CSS block"
  (interactive)
  (end-of-line)
  (search-backward "{")
  (while (not (looking-at "}"))
    (join-line -1)))
