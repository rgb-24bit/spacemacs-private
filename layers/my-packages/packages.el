;;; packages.el --- my-local-packages layer packages file for Spacemacs.

(defconst my-packages-packages
  '((css-sort-buffer :location local))
  )

(defun my-packages/css-sort-buffer ()
  (use-package css-sort-buffer))

;;; packages.el ends here
