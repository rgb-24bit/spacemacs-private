;;; packages.el --- my-csharp layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 rgb-24bit
;;
;; Author:  rgb-24bit <rgb-24bit@foxmail.com>
;; URL: https://github.com/rgb-24bit/spacemacs-private

;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst my-csharp-packages
  '(
    company
    ggtags
    csharp-mode
    ))

(defun my-csharp/post-init-company()
  (spacemacs|add-company-backends
   :backends company-capf
   :modes csharp-mode))

(defun my-csharp/post-init-ggtags ()
  (add-hook 'csharp-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))

(defun my-csharp/init-csharp-mode()
  (use-package csharp-mode
    :defer t))
