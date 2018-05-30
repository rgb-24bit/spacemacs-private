;;; funcs.el --- my-c-c++ layer packages file for Spacemacs.
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

;; realgud

(defun spacemacs//short-key-state (modeon)
  "Set evil-evilified-state explicitly."
  (if modeon
      (evil-evilified-state)
    (evil-normal-state)))
