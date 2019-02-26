;;; funcs.el --- my-web layer function file for Spacemacs.

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
