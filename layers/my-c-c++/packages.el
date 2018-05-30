;;; packages.el --- my-c-c++ layer packages file for Spacemacs.
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

;;; This layer is used to c-c++ learning and idea testing

(setq my-c-c++-packages
  '(
    cc-mode
    disaster
    company
    (company-c-headers :requires company)
    ggtags
    counsel-gtags
    realgud
    ;; semantic
    ;; stickyfunc-enhance
    google-c-style
    ))

(defun my-c-c++/init-cc-mode ()
  (use-package cc-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist
                   `("\\.h\\'" . ,c-c++-default-mode-for-headers)))
    :config
    (progn
      (require 'compile)
      (c-toggle-auto-newline 1)
      (dolist (mode c-c++-modes)
        (spacemacs/declare-prefix-for-mode mode "mc" "compile")
        (spacemacs/declare-prefix-for-mode mode "mg" "goto")
        (spacemacs/declare-prefix-for-mode mode "mp" "project")
        (spacemacs/set-leader-keys-for-major-mode mode
          "ga" 'projectile-find-other-file
          "gA" 'projectile-find-other-file-other-window)))))

(defun my-c-c++/init-disaster ()
  (use-package disaster
    :defer t
    :commands (disaster)
    :init
    (progn
      (dolist (mode c-c++-modes)
        (spacemacs/set-leader-keys-for-major-mode mode
          "D" 'disaster)))))

(defun my-c-c++/post-init-company ()
  (spacemacs|add-company-backends
    :backends company-capf
    :modes c-mode-common))

(defun my-c-c++/init-company-c-headers ()
  (use-package company-c-headers
    :defer t
    :init (spacemacs|add-company-backends
            :backends company-c-headers
            :modes c-mode-common)))

(defun my-c-c++/post-init-ggtags ()
  (add-hook 'c-mode-local-vars-hook #'spacemacs/ggtags-mode-enable)
  (add-hook 'c++-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))

(defun my-c-c++/post-init-counsel-gtags ()
  (dolist (mode c-c++-modes)
    (spacemacs/counsel-gtags-define-keys-for-mode mode)))

(defun my-c-c++/init-realgud()
  (use-package realgud
    :defer t
    :commands (realgud:gdb)
    :init
    (progn
      (dolist (mode c-c++-modes)
        (spacemacs/set-leader-keys-for-major-mode mode
          "dd" 'realgud:gdb
          "de" 'realgud:cmd-eval-dwim))
      (advice-add 'realgud-short-key-mode-setup
                  :before #'spacemacs//short-key-state)
      (evilified-state-evilify-map realgud:shortkey-mode-map
        :eval-after-load realgud
        :mode realgud-short-key-mode
        :bindings
        "s" 'realgud:cmd-next
        "i" 'realgud:cmd-step
        "b" 'realgud:cmd-break
        "B" 'realgud:cmd-clear
        "o" 'realgud:cmd-finish
        "c" 'realgud:cmd-continue
        "e" 'realgud:cmd-eval
        "r" 'realgud:cmd-restart
        "q" 'realgud:cmd-quit
        "S" 'realgud-window-cmd-undisturb-src))))

(defun my-c-c++/init-google-c-style ()
  (use-package google-c-style
    :if (or 'c-c++-enable-google-style 'c-c++-enable-google-newline)
    :config (progn
    (when 'c-c++-enable-google-style (add-hook 'c-mode-common-hook 'google-set-c-style))
    (when 'c-c++-enable-google-newline (add-hook 'c-mode-common-hook 'google-set-c-style)))))

;; (defun my-c-c++/post-init-semantic ()
;;   (spacemacs/add-to-hooks 'semantic-mode c-c++-mode-hooks))

;; (defun my-c-c++/post-init-stickyfunc-enhance ()
;;   (spacemacs/add-to-hooks 'spacemacs/lazy-load-stickyfunc-enhance c-c++-mode-hooks))
