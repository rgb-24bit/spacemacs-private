;;; packages.el --- my-html layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 rgb-24bit
;;
;; Author:  rgb-24bit <rgb-24bit@foxmail.com>
;; URL: https://github.com/rgb-24bit/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst my-html-packages
  '((html-mode :location built-in)
    company
    css-mode
    ;; css-eldoc
    tagedit
    impatient-mode
    web-beautify))

(defun my-html/init-html-mode ()
  (use-package html-mode
    :defer t
    :mode
    (("\\.jsp\\'" . html-mode)
     ("\\.tmpl\\'" . html-mode)
     ("\\.djhtml\\'" . html-mode))))

(defun my-html/post-init-company ()
  (spacemacs|add-company-backends
    :backends company-css
    :modes css-mode))

(defun my-html/init-css-mode ()
  (use-package css-mode
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'css-mode
        "zc" 'spacemacs/css-contract-statement
        "zo" 'spacemacs/css-expand-statement))))

;; not working
;; (defun my-html/init-css-eldoc ()
;;   (use-package css-eldoc
;;     :defer t
;;     :config
;;     (progn
;;       (add-hook 'css-mode-hook 'turn-on-css-eldoc))))

(defun my-html/init-tagedit ()
  (use-package tagedit
    :defer t
    :config
    (progn
      (tagedit-add-experimental-features)
      (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))
      (spacemacs|diminish tagedit-mode " Ⓣ" " T"))))

(defun my-html/init-impatient-mode ()
  (use-package impatient-mode
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'mhtml-mode "i" 'spacemacs/impatient-mode)
      (spacemacs/set-leader-keys-for-major-mode 'css-mode "i" 'spacemacs/impatient-mode))
    :config
    (progn
      ;; Alist indicating which filter should be used for which modes.
      (setq imp-default-user-filters
            '((html-mode . nil)
              (mhtml-mode . nil)
              (web-mode  . nil))))))

(defun my-html/pre-init-web-beautify ()
  (add-to-list 'spacemacs--web-beautify-modes (cons 'css-mode 'web-beautify-css))
  (add-to-list 'spacemacs--web-beautify-modes (cons 'mhtml-mode 'web-beautify-html)))

;;; packages.el ends here
