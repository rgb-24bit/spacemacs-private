;;; packages.el --- my-c-c++ layer packages file for Spacemacs.

(defconst my-c-c++-packages
  '(cc-mode
    company
    (company-c-headers :requires company)
    ))

(defun my-c-c++/init-cc-mode ()
  (use-package cc-mode
    :defer t))

(defun my-c-c++/post-init-company ()
  (spacemacs|add-company-backends
    :backends company-tabnine company-capf company-c-headers
    :modes c-mode-common))

(defun my-c-c++/init-company-c-headers ()
  (use-package company-c-headers
    :defer t))

;;; packages.el ends here
