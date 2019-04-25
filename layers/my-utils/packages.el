;;; packages.el --- my-utils layer packages file for Spacemacs.

(defconst my-utils-packages
  '((insert-translated-name :location local)
    (flex :location local)
    (bison :location local)
    (restclient :location local)
    (auto-save :location local)
    ))

(defun my-utils/init-insert-translated-name ()
  (use-package insert-translated-name
    :config
    (global-set-key (kbd "C-c i") 'insert-translated-name-insert)))

(defun my-utils/init-flex ()
  (use-package flex
    :defer t
    :mode ("\\.l$" . flex-mode)
    :init (autoload 'flex-mode "flex")))

(defun my-utils/init-bison ()
  (use-package bison
    :defer t
    :mode ("\\.y$" . bison-mode)
    :init (autoload 'bison-mode "bison")))

(defun my-utils/init-restclient ()
  (use-package restclient
    :defer t
    :mode ("\\.http\\'" . restclient-mode)))

(defun my-utils/init-auto-save ()
  (use-package auto-save
    :config
    (progn
      (auto-save-enable)
      (setq auto-save-silent t))))

;;; packages.el ends here
