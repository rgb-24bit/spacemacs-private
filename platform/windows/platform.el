;;; platform.el --- Platform Configuration Template

(defun spacemacs-private-for-platform/layers ()
  "Configuration layers for the appropriate platform."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   spacemacs-private/dotspacemacs-distribution 'spacemacs-base

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   spacemacs-private/dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")

   ;; List of configuration layers to load.
   spacemacs-private/dotspacemacs-configuration-layers
   '(
     ;; spacemacs layers
     spacemacs-completion
     spacemacs-editing
     spacemacs-editing-visual
     spacemacs-modeline
     spacemacs-navigation
     spacemacs-org
     spacemacs-project
     spacemacs-visual

     ;; completion layers
     auto-completion
     helm
     ivy

     ;; emacs layers
     better-defaults
     (org :variables org-enable-github-support t)

     ;; tools layers
     lsp
     command-log
     finance

     ;; lang layers
     graphviz
     yaml
     emacs-lisp
     markdown
     latex
     plantuml
     (sql :variables
          sql-capitalize-keywords t)
     (python :variables
             python-backend 'anaconda)
     (c-c++ :variables
            c-c++-enable-google-style t
            c-c++-default-mode-for-headers 'c-mode)

     ;; my layers
     ;; my-python
     my-csharp
     my-java
     my-web
     my-utils
     ;; my-themes
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   spacemacs-private/dotspacemacs-additional-packages '(cnfonts edit-indirect)

   ;; A list of packages that cannot be updated.
   spacemacs-private/dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   spacemacs-private/dotspacemacs-excluded-packages
   '(
     ;; spacemacs
     writeroom-mode

     ;; auto-completion
     yasnippet-snippets

     ;; python layer, windows, not use
     pyenv-mode lsp-python lsp-python-ms

     ;; c-c++ layer
     clang-format company-rtags company-ycmd gdb-mi flycheck-rtags
     helm-rtags ivy-rtags rtags cquery ccls

     ;; my java
     company-tabnine
     )
   ))

(defun spacemacs-private-for-platform/init ()
  "Configuring spacemacs initialization configuration."
  (setq-default
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   spacemacs-private/dotspacemacs-themes '(sanityinc-solarized-dark
                                           sanityinc-solarized-light
                                           spacemacs-dark
                                           spacemacs-light)

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   spacemacs-private/dotspacemacs-default-font nil
  ))

(defun spacemacs-private-for-platform/user-init()
  "Configuring user initialization for the appropriate platform."
  ;; ===========================================================================
  ;; chinese and english font config
  ;; ===========================================================================

  (set-face-attribute
   'default nil
   :font (font-spec :name "-outline-Source Code Pro-bold-normal-normal-mono-*-*-*-*-c-*-iso10646-1"
                    :weight 'normal
                    :slant 'normal
                    :size 9.0))

  (if window-system
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font
         (frame-parameter nil 'font)
         charset
         (font-spec :name "-outline-微软雅黑-normal-normal-normal-sans-*-*-*-*-p-*-iso10646-1"
                    :weight 'normal
                    :slant 'normal
                    :size 10.5))))
  )

(defun spacemacs-private-for-platform/user-config ()
  "Configuring user configuration for the appropriate platform."
  ;; ===========================================================================
  ;;                Windows configuration
  ;; ===========================================================================
  (setq-default w32-system-coding-system 'cp936-dos)

    ;; ===========================================================================
  ;;                c-c++ config
  ;; ===========================================================================

  ;; c-c++ indentation style settings
  (setq c-default-style "linux"
        c-basic-offset 2)

  ;; https://emacs-china.org/t/topic/5319
  ;; (setq-default sp-autoinsert-pair nil
  ;;               sp-autodelete-pair nil
  ;;               sp-autoskip-closing-pair nil
  ;;               sp-escape-quotes-after-insert nil)

  ;; comments style setting
  (add-hook 'c-mode-hook (lambda () (c-toggle-comment-style)))

  ;; ===========================================================================
  ;;                python config
  ;; ===========================================================================

  ;; python indentation style settings
  (setq python-indent-offset 4
        python-indent-guess-indent-offset nil
        python-indent-guess-indent-offset-verbose nil)

  ;; fix elpy bug
  (setq python-shell-completion-native-enable nil)

  ;; ===========================================================================
  ;;                groovy config
  ;; ===========================================================================

  ;; groovy indent setting
  (setq groovy-indent-offset 2)

  ;; ===========================================================================
  ;;                org config
  ;; ===========================================================================

  ;; org-mode programming language support settings
  (setq org-babel-load-languages
        '((C          . t)
          (sql        . t)
          (java       . t)
          (ledger     . t)
          (latex      . t)
          (sqlite     . t)
          (python     . t)
          (plantuml   . t)
          (emacs-lisp . t)
          (octave     . t)
          (dot        . t)
          (ditaa      . t)))

  ;; plantuml.jar and ditaa.jar path setting
  (setq org-plantuml-jar-path
        (expand-file-name "~/.spacemacs.d/plantuml.jar"))
  (setq org-ditaa-jar-path "~/.spacemacs.d/ditaa.jar")

  ;; Set the hidden font style mark, the direct effect
  (setq org-hide-emphasis-markers t)

  ;; Set to prevent editing of invisible text
  (setq org-catch-invisible-edits 'error)

  ;; The setting code is highlighted
  (setq org-src-fontify-natively t)

  ;; Some config
  (with-eval-after-load 'org
    (progn
      ;; ===========================================================================
      ;; org-mode gtd state settings
      ;; @ /! Switch to this state will be prompted to enter
      ;; ===========================================================================

      (setq org-todo-keywords
            '((sequence "TODO(t!)" "NEXT(n)" "WAIT(w)" "|" "DONE(d@/!)" "ABORT(a@/!)")))

      ;; (let ((red "#dc322f") (green "#859900") (blue "#268bd2") (violet "#6c71c4"))
      ;;   (setq org-todo-keyword-faces
      ;;         `(("TODO"     . ,red)
      ;;           ("NEXT"     . ,red)
      ;;           ("WAITTING" . ,violet)
      ;;           ("SOMEDAY"  . ,blue)
      ;;           ("MAYBE"    . ,blue)
      ;;           ("DONE"     . ,green)
      ;;           ("ABORT"    . ,green))))

      ;; M-RET keybinding set
      (org-defkey org-mode-map [(meta return)] 'org-meta-return)

      ;; Convenient timing
      (org-defkey org-mode-map [(f5)] 'org-clock-in)
      (org-defkey org-mode-map [(f8)] 'org-clock-out)))

  ;; Org-capture template settings
  (setq org-task-file "~/record/task/task.org")
  (setq org-memo-file "~/record/task/memo.org")
  (setq org-idea-file "~/record/idea/idea.org")

  (setq org-capture-templates
        '(("t" "Task" entry (file+headline org-task-file "Task")
           "* TODO [#B] %^{HEADLINE} %^g\n  %?"
           :empty-lines 1)
          ("d" "Done" entry (file+headline org-task-file "Done")
           "* DONE %^{HEADLINE} %^g\n  %?"
           :empty-lines 1)
          ("m" "Memo" entry (file+headline org-memo-file "Memo")
           "* TODO [#B] %^{HEADLINE} %^g\n  %?"
           :empty-lines 1)
          ("i" "Idea" entry (file+headline org-idea-file "Idea")
           "* %^{HEADLINE}\n  %?"
           :empty-lines 1)))

  ;; clock table group by tags
  ;; https://gist.github.com/rgb-24bit/deaa3ac4fe588cab7d2661fa69a4439b
  (defun clocktable-by-tag/shift-cell (n)
    (let ((str ""))
      (dotimes (i n)
        (setq str (concat str "| ")))
      str))

  (defun clocktable-by-tag/insert-tag (params)
    (let ((tag (plist-get params :tags)))
      (insert "|--\n")
      (insert (format "| %s | *Tag time* |\n" tag))
      (insert "|--\n")
      (let ((total 0))
        ;;      (mapcar
        (mapc
         (lambda (file)
           (let ((clock-data (with-current-buffer (find-file-noselect file)
                               (org-clock-get-table-data (buffer-name) params))))
             (when (> (nth 1 clock-data) 0)
               (setq total (+ total (nth 1 clock-data)))
               ;; (insert (format "| | File *%s* | %.2f |\n"
               ;;                 (file-name-nondirectory file)
               ;;                 (/ (nth 1 clock-data) 60.0)))
               (dolist (entry (nth 2 clock-data))
                 (insert (format "| | %s%s | %s %.2f |\n"
                                 (org-clocktable-indent-string (nth 0 entry))
                                 (nth 1 entry)
                                 (clocktable-by-tag/shift-cell (nth 0 entry))
                                 (/ (nth 3 entry) 60.0)))))))
         `(,buffer-file-name))
        (save-excursion
          (re-search-backward "*Tag time*")
          (org-table-next-field)
          (org-table-blank-field)
          (insert (format "*%.2f*" (/ total 60.0)))))
      (org-table-align)))

  (defun org-dblock-write:clocktable-by-tag (params)
    (insert "| Tag | Headline | Time (h) |\n")
    ;; (insert "|     |          | <r>  |\n")
    (let ((tags (plist-get params :tags)))
      (mapcar (lambda (tag)
                (setq params (plist-put params :tags tag))
                (clocktable-by-tag/insert-tag params))
              tags)))

  (defun rgb-24bit/insert-clock-entry ()
    "Insert a clock entity."
    (interactive)
    (org-clock-in)
    (org-clock-out))

  (defun rgb-24bit/org-delete-element ()
    "Delete org element."
    (interactive)
    (org-mark-element)
    (kill-region (region-beginning) (region-end)))

  ;; ===========================================================================
  ;;                front-end config
  ;; ===========================================================================

  ;; css offset
  (setq css-indent-offset 2)

  ;; javascript offset
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)

  (add-hook 'web-mode-hook 'turn-off-smartparens-mode)

  ;; ===========================================================================
  ;;                my ivy function
  ;; ===========================================================================

  (defun rgb-24bit/insert-keybinding (key)
    "Insert key binding string."
    (interactive "kType key sequence: ")
    (if (null (equal key "\r"))
        (insert (help-key-description key nil))))

  (defun rgb-24bit/ivy-read ()
    "Used to call my own defined function."
    (interactive)
    (ivy-read "Function:"
              '(rgb-24bit/insert-clock-entry
                rgb-24bit/insert-around-word-or-region
                rgb-24bit/org-delete-element
                rgb-24bit/insert-keybinding
                )
              :action (lambda (x)
                        (command-execute
                         (intern x)))))

  (global-set-key (kbd "M-n") 'rgb-24bit/ivy-read)


  ;; ===========================================================================
  ;;                latex config
  ;; ===========================================================================

  ;; https://stackoverflow.com/questions/2477195/latex-indentation-formatting-in-emacs
  (setq LaTeX-item-indent 0)
  )

;;; platform.el ends here
