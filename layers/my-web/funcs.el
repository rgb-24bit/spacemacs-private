;;; funcs.el --- my-web layer function file for Spacemacs.

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

(defun spacemacs/js-doc-set-key-bindings (mode)
  "Setup the key bindings for `js2-doc' for the given MODE."
  (spacemacs/declare-prefix-for-mode mode "md" "documentation")
  (spacemacs/set-leader-keys-for-major-mode mode
    "db" 'js-doc-insert-file-doc
    "df" (if (configuration-layer/package-used-p 'yasnippet)
             'js-doc-insert-function-doc-snippet
           'js-doc-insert-function-doc)
    "dt" 'js-doc-insert-tag
    "dh" 'js-doc-describe-tag))
