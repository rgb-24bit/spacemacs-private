;;; packages.el --- my-java layer packages file for Spacemacs.
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

;;; This layer is used to Java basic learning and idea testing

(defconst my-java-packages
  '(
    company
    ggtags
    counsel-gtags
    (java-mode :location built-in)
    ))

(defun my-java/post-init-company()
  (spacemacs|add-company-backends
    :backends company-capf
    :modes java-mode))

(defun my-java/post-init-ggtags ()
  (add-hook 'java-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))

(defun my-java/post-init-counsel-gtags ()
  (spacemacs/counsel-gtags-define-keys-for-mode 'java-mode))

(defun my-java/init-java-mode ()
  (use-package java-mode
    :defer t))

;;; packages.el ends here
