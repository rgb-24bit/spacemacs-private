;;; packages.el --- my-groovy layer packages file for Spacemacs.
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

(setq my-groovy-packages
      '(
        company
        groovy-mode
        ))

(defun my-groovy/post-init-company ()
  (spacemacs|add-company-backends :modes groovy-mode))

(defun my-groovy/init-groovy-mode ()
  (use-package groovy-mode
    :defer t
    :init
    (progn
      (spacemacs/declare-prefix-for-mode 'groovy-mode "ms" "REPL")
      (spacemacs/set-leader-keys-for-major-mode 'groovy-mode
        "'"  'run-groovy
        "sB" 'spacemacs/groovy-load-file-switch
        "sb" 'spacemacs/groovy-load-file
        "sF" 'spacemacs/groovy-send-definition-switch
        "sf" 'groovy-send-definition
        "si" 'run-groovy
        "sR" 'spacemacs/groovy-send-region-switch
        "sr" 'groovy-send-region))))

;;; packages.el ends here
