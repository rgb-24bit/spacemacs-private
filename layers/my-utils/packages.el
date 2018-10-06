;;; packages.el --- my-utils layer packages file for Spacemacs.

(defconst my-utils-packages
  '((insert-translated-name :location local))
  )

(defun my-utils/init-insert-translated-name ()
  (use-package insert-translated-name
    :config
    (global-set-key (kbd "C-c i") 'insert-translated-name-insert)))

;;; packages.el ends here
