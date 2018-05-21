;;; packages.el --- my-javascript layer packages file for Spacemacs.
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

(defconst my-javascript-packages
  '(
    company
    counsel-gtags
    evil-matchit
    ggtags
    imenu
    js-doc
    js2-mode
    web-beautify
    yasnippet
    ))

(defun my-javascript/post-init-counsel-gtags()
  (spacemacs/counsel-gtags-define-keys-for-mode 'js2-mode))

(defun my-javascript/post-init-evil-matchit ()
  (add-hook `js2-mode `turn-on-evil-matchit-mode))

(defun my-javascript/post-init-company ()
  (spacemacs|add-company-backends
    :backends company-capf
    :modes js2-mode))

(defun my-javascript/post-init-ggtags ()
  (add-hook 'js2-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))

(defun my-javascript/post-init-imenu ()
  ;; Required to make imenu functions work correctly
  (add-hook 'js2-mode-hook 'js2-imenu-extras-mode))

(defun my-javascript/init-js-doc ()
  (use-package js-doc
    :defer t
    :init (spacemacs/js-doc-set-key-bindings 'js2-mode)))

(defun my-javascript/init-js2-mode ()
  (use-package js2-mode
    :defer t
    :mode "\\.js\\'"
    :config
    (progn
      ;; prefixes
      (spacemacs/declare-prefix-for-mode 'js2-mode "mz" "folding")
      ;; key bindings
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode
        "w" 'js2-mode-toggle-warnings-and-errors
        "zc" 'js2-mode-hide-element
        "zo" 'js2-mode-show-element
        "zr" 'js2-mode-show-all
        "ze" 'js2-mode-toggle-element
        "zF" 'js2-mode-toggle-hide-functions
        "zC" 'js2-mode-toggle-hide-comments))))

(defun my-javascript/pre-init-web-beautify ()
  (add-to-list 'spacemacs--web-beautify-modes (cons 'js2-mode 'web-beautify-js)))

(defun my-javascript/pre-init-yasnippet ()
  (spacemacs|use-package-add-hook yasnippet
    :post-config
    (yas-activate-extra-mode 'js-mode)))

;;; packages.el ends here
