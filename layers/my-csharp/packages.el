;;; packages.el --- my-csharp layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <Administrator@PC-201404041139>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst my-csharp-packages
  '(
    company
    csharp-mode
    evil-matchit
    ggtags
    helm-gtags
    ))

(defun my-csharp/init-csharp-mode()
  (use-package csharp-mode
    :defer t))

(defun my-csharp/post-init-company()
  (spacemacs|add-company-backends
   :backends company-capf
   :modes csharp-mode))

(defun my-csharp/post-init-evil-matchit ()
  (with-eval-after-load 'evil-matchit
    (plist-put evilmi-plugins 'csharp-mode
               '((evilmi-simple-get-tag evilmi-simple-jump)
                 (evilmi-c-get-tag evilmi-c-jump))))
  (add-hook 'csharp-mode-hook 'turn-on-evil-matchit-mode))

(defun my-csharp/post-init-ggtags ()
  (add-hook 'csharp-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))

(defun my-csharp/post-init-helm-gtags ()
  (spacemacs/helm-gtags-define-keys-for-mode 'csharp-mode))

