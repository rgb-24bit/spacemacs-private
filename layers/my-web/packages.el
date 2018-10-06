;;; packages.el --- my-web layer packages file for Spacemacs.

(defconst my-web-packages
  '((mhtml-mode :location built-in)
    company
    tagedit
    emmet-mode
    css-mode
    (css-sort-buffer :location local)
    restclient
    impatient-mode
    web-beautify
    js2-mode
    js-doc
    yasnippet
    )
  )

(defun my-web/init-mhtml-mode ()
  (use-package mhtml-mode
    :defer t
    :mode
    (("\\.jsp\\'" . mhtml-mode)
     ("\\.tmpl\\'" . mhtml-mode)
     ("\\.djhtml\\'" . mhtml-mode))))

(defun my-web/post-init-company ()
  (spacemacs|add-company-backends
    :backends company-files
    :modes mhtml-mode)
  (spacemacs|add-company-backends
    :backends company-css
    :modes css-mode)
  (spacemacs|add-company-backends
    :backends company-capf
    :modes js2-mode
    ))

(defun my-web/init-emmet-mode ()
  (use-package emmet-mode
    :defer t))

(defun my-web/init-css-mode ()
  (use-package css-mode
    :defer t))

(defun my-web/init-css-sort-buffer ()
  (use-package css-sort-buffer))

(defun my-web/init-tagedit ()
  (use-package tagedit
    :defer t
    :config
    (progn
      (tagedit-add-experimental-features)
      (add-hook 'mthml-mode-hook (lambda() (tar-mode 1))))))

(defun my-web/init-restclient ()
  (use-package restclient
    :defer t
    :mode
    (("\\.http\\'" . restclient-mode))))

(defun my-web/init-impatient-mode ()
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

(defun my-web/init-web-beautify ()
  (use-package web-beautify
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'mhtml-mode "=" ' web-beautify-html)
      (spacemacs/set-leader-keys-for-major-mode 'css-mode "=" 'web-beautify-css)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "=" 'web-beautify-js))))

(defun my-web/init-js2-mode ()
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

(defun my-web/init-js-doc ()
  (use-package js-doc
    :defer t
    :init (spacemacs/js-doc-set-key-bindings 'js2-mode)))

(defun my-web/pre-init-yasnippet ()
  (spacemacs|use-package-add-hook yasnippet
    :post-config
    (yas-activate-extra-mode 'js-mode)))

;;; packages.el ends here
