;;; packages.el --- my-java layer packages file for Spacemacs.

(defconst my-java-packages
  '(
    company
    (java-mode :location built-in)
    ))

(defun my-java/post-init-company()
  (spacemacs|add-company-backends
    :backends company-capf company-files
    :modes java-mode))

(defun my-java/init-java-mode()
  (use-package java-mode
    :defer t))

;;; packages.el ends here
