;;; packages.el --- my-utils layer packages file for Spacemacs.

(defconst my-utils-packages
  '((insert-translated-name :location local)
    (flex :location local)
    (bison :location local)
    (restclient :location local)
    (auto-save :location local)
    manage-minor-mode
    (keyfreq :location local)
    (css-sort-buffer :location local)
    rfc-mode
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

(defun my-utils/init-css-sort-buffer ()
  (use-package css-sort-buffer
    :defer t))

(defun my-utils/init-keyfreq ()
  (use-package keyfreq
    :config
    (progn
      (keyfreq-mode 1)
      (keyfreq-autosave-mode 1)
      (setq keyfreq-excluded-commands
            '(self-insert-command
              forward-char
              backward-char
              previous-line
              next-line)))))

(defun my-utils/init-manage-minor-mode ()
  (use-package manage-minor-mode
    :defer t))

(defun my-utils/init-rfc-mode ()
  (use-package rfc-mode
    :commands (rfc-mode-browse rfc-mode-read)))

;;; packages.el ends here
