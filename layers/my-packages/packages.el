;;; packages.el --- my-local-packages layer packages file for Spacemacs.

(defconst my-packages-packages
  '((css-sort-buffer :location local)
    ;; (posframe :location local)
    (nox :location local)
    (jsonrpc)
    manage-minor-mode
    (keyfreq :location local)
    ;; (bookmark+ :location local)
    )
  )

(defun my-packages/init-css-sort-buffer ()
  (use-package css-sort-buffer))

;; (defun my-packages/init-posframe ()
;;   (use-package posframe))

(defun my-packages/init-nox ()
  (use-package nox
    :defer t))

(defun my-packages/init-jsonrpc ()
  (use-package jsonrpc))

(defun my-packages/init-keyfreq ()
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

;; (defun my-packages/init-bookmark+ ()
;;   (use-package bookmark+))

(defun my-packages/init-manage-minor-mode ()
  (use-package manage-minor-mode))

;;; packages.el ends here
