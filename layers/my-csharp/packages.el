;;; packages.el --- my-csharp layer packages file for Spacemacs.

(defconst my-csharp-packages
  '(
    company
    csharp-mode
    ))

(defun my-csharp/post-init-company()
  (spacemacs|add-company-backends
   :backends company-capf company-files
   :modes csharp-mode))

(defun my-csharp/init-csharp-mode()
  (use-package csharp-mode
    :defer t))

;;; packages.el ends here
