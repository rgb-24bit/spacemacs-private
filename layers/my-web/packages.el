;;; packages.el --- my-web layer packages file for Spacemacs.

(defconst my-web-packages
  '(
    ;; common
    company
    web-beautify

    ;; for html
    web-mode
    (company-web :requires company)
    emmet-mode

    ;; for css
    css-mode
    (css-sort-buffer :location local)

    ;; for javascript
    js2-mode
    js-doc
    )
  )

(defun my-web/post-init-company ()
  (spacemacs|add-company-backends
    :backends company-css
    :modes css-mode)
  (spacemacs|add-company-backends
    :backends company-capf
    :modes js2-mode))

(defun my-web/init-web-beautify ()
  (use-package web-beautify
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'web-mode "=" 'web-beautify-html)
      (spacemacs/set-leader-keys-for-major-mode 'css-mode "=" 'web-beautify-css)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "=" 'web-beautify-js))))

(defun my-web/init-emmet-mode ()
  (use-package emmet-mode
    :defer t
    :init (spacemacs/add-to-hooks 'emmet-mode '(web-mode-hook))))

(defun my-web/init-web-mode ()
  (use-package web-mode
    :defer t
    :config
    (progn
      ;; =======================================================================
      ;; Spacemacs style keybingding
      ;; =======================================================================

      (spacemacs/declare-prefix-for-mode 'web-mode "mE" "errors")
      (spacemacs/declare-prefix-for-mode 'web-mode "mg" "goto")
      (spacemacs/declare-prefix-for-mode 'web-mode "mh" "dom")
      (spacemacs/declare-prefix-for-mode 'web-mode "mr" "refactor")
      (spacemacs/set-leader-keys-for-major-mode 'web-mode
        "El" 'web-mode-dom-errors-show
        "gb" 'web-mode-element-beginning
        "gc" 'web-mode-element-child
        "gp" 'web-mode-element-parent
        "gs" 'web-mode-element-sibling-next
        "hp" 'web-mode-dom-xpath
        "rc" 'web-mode-element-clone
        "rd" 'web-mode-element-vanish
        "rk" 'web-mode-element-kill
        "rr" 'web-mode-element-rename
        "rw" 'web-mode-element-wrap
        "z" 'web-mode-fold-or-unfold
        "i" 'browse-url-of-file)

      ;; =======================================================================
      ;; web-mode theme
      ;; =======================================================================

      (set-face-attribute 'web-mode-doctype-face nil :foreground "#586e75")
      (set-face-attribute 'web-mode-html-tag-face nil :foreground "#859900")
      (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#586e75")
      (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#268bd2")
      (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#2aa198")
      (set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "#268bd2")
      (set-face-attribute 'web-mode-html-tag-custom-face nil :foreground "#859900")

      ;; =======================================================================
      ;; others
      ;; =======================================================================

      ;; indentation settings
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-css-indent-offset 2)
      (setq web-mode-code-indent-offset 2)

      ;; colorization config
      (setq web-mode-enable-css-colorization t))

    :mode
    (("\\.phtml\\'"      . web-mode)
     ("\\.tpl\\.php\\'"  . web-mode)
     ("\\.twig\\'"       . web-mode)
     ("\\.xml\\'"        . web-mode)
     ("\\.html\\'"       . web-mode)
     ("\\.htm\\'"        . web-mode)
     ("\\.[gj]sp\\'"     . web-mode)
     ("\\.as[cp]x?\\'"   . web-mode)
     ("\\.eex\\'"        . web-mode)
     ("\\.erb\\'"        . web-mode)
     ("\\.mustache\\'"   . web-mode)
     ("\\.handlebars\\'" . web-mode)
     ("\\.hbs\\'"        . web-mode)
     ("\\.eco\\'"        . web-mode)
     ("\\.ejs\\'"        . web-mode)
     ("\\.djhtml\\'"     . web-mode)
     ("\\.tmpl\\'"       . web-mode))))

(defun my-web/init-company-web ()
  (use-package company-web
    :defer t
    :init
    (spacemacs|add-company-backends
      :backends (company-web-html company-files)
      :modes web-mode)))

(defun my-web/init-css-mode ()
  (use-package css-mode
    :defer t))

(defun my-web/init-css-sort-buffer ()
  (use-package css-sort-buffer))

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
    :init (spacemacs/js-doc-set-key-bindings 'js2-mode)
    :config
    (setq js-doc-mail-address "rgb-24bit@foxmail.com"
          js-doc-author (format "rgb-24bit <%s>" js-doc-mail-address))))

;;; packages.el ends here
