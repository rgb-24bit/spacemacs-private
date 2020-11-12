;;; for-macos.el --- Configuration for macos

;; =============================================================================
;;                  advice for dotspacemacs/layers
;; =============================================================================

(defun advice--dotspacemacs/layers ()
  "Advice for function `dotspacemacs/layers'."
  (setq-default
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; completion layers
     auto-completion
     helm
     ivy

     ;; source control layers
     (version-control :variables
                      version-control-diff-tool 'nil)
     git

     ;; emacs layers
     better-defaults
     (ibuffer :variables ibuffer-group-buffers-by 'nil)
     (org :variables org-enable-github-support t)

     ;; tools layers
     dap
     (lsp :variables
          lsp-ui-doc-enable nil)

     command-log
     docker
     finance
     nginx
     (osx :variables
          osx-command-as       'meta
          osx-option-as        'meta
          osx-control-as       'control
          osx-function-as      'control
          osx-right-command-as 'left
          osx-right-option-as  'left
          osx-right-control-as 'left
          osx-swap-option-and-command nil)
     (shell :variables
            shell-default-shell 'vterm
            shell-default-position 'bottom)

     ;; lang layers
     ;; (c-c++ :variables
     ;;        c-c++-default-mode-for-headers 'c-mode
     ;;        c-c++-backend 'lsp-cquery)
     csv
     emacs-lisp
     graphviz
     (go :variables go-tab-width 4)
     html
     json
     latex
     major-modes
     markdown
     plantuml
     (python :variables
             python-backend 'lsp)
     shell-scripts
     (sql :variables
          sql-capitalize-keywords t)
     yaml

     ;; my layers
     my-packages
     my-utils
     ; my-rime
     )
   )
  )

(unless (advice-member-p 'dotspacemacs/layers #'advice--dotspacemacs/layers)
  (advice-add 'dotspacemacs/layers :after #'advice--dotspacemacs/layers))

;; =============================================================================
;;                  advice for dotspacemacs/init
;; =============================================================================

;; (defun advice--dotspacemacs/init ()
;;   "Advice for function `dotspacemacs/init'."
;;   )

;; (unless (advice-member-p 'dotspacemacs/init #'advice--dotspacemacs/init)
;;   (advice-add 'dotspacemacs/init :after #'advice--dotspacemacs/init))

;; =============================================================================
;;                  advice for dotspacemacs/user-init
;; =============================================================================

(defun advice--dotspacemacs/user-init ()
  "Advice for function `dotspacemacs/user-init'."
  ;; ===========================================================================
  ;; chinese and english font config
  ;; ===========================================================================

  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-Source Code Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
                    :weight 'normal
                    :slant 'normal
                    :size 14))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-*-STKaiti-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
                :weight 'normal
                :slant 'normal
                :size 16.5)))
  )

(unless (advice-member-p 'dotspacemacs/user-init #'advice--dotspacemacs/user-init)
  (advice-add 'dotspacemacs/user-init :after #'advice--dotspacemacs/user-init))

;; =============================================================================
;;                  advice for dotspacemacs/user-config
;; =============================================================================

(defun advice--dotspacemacs/user-config ()
  "Advice for function `dotspacemacs/user-config'."
  ;; ===========================================================================
  ;;                MacOS configuration
  ;; ===========================================================================

  ;; Use mdfind as locate command
  (setq locate-command "mdfind")

  ;; close swipe left/right
  (global-set-key [swipe-left] nil)
  (global-set-key [swipe-right] nil)
  ;; (global-set-key [switch-frame] nil)

  ;; ignore sys file
  (setq counsel-find-file-ignore-regexp "\\.DS_Store\\'")

  ;; ===========================================================================
  ;; Lsp config
  ;; ===========================================================================

  (setq-default
   ;; Disable snippet completion support
   lsp-enable-snippet nil

   ;; Disable lsp-ui-sideline
   lsp-ui-sideline-enable
   )

  ;; ===========================================================================
  ;; Magit config
  ;; ===========================================================================

  ;; repository list config
  (setq magit-repository-directories
        '(("~/repositories"                    . 1)
          ("~/bytedance"                       . 1)
          ("~/.spacemacs.d"                    . 0)
          ("~/.emacs.d"                        . 0)
          ("~/record"                          . 0)
          ("~/go/src/git.byted.org/ee/people"  . 2)
          ))

  ;; https://emacs.stackexchange.com/questions/32696/how-to-use-magit-list-repositories
  (setq magit-repolist-columns
        '(("S"        1 magit-repolist-column-flag                   ())
          ("L>U"      3 magit-repolist-column-unpushed-to-upstream   ((:right-align t)))
          ("Name"    25 magit-repolist-column-ident                  ())
          ("Branch"  20 magit-repolist-column-branch                 ())
          ("Path"    99 magit-repolist-column-path                   ())))

  (setq magit-repolist-column-flag-alist
        '((magit-untracked-files . "N")
          (magit-unstaged-files  . "M")
          (magit-staged-files    . "M")))

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

  ;; Disaster project root file
  (setq disaster-project-root-files
        '(("Makefile")
          ("setup.py" "package.json")
          (".git/")))

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

  ;; python interpreter path
  (setq python-shell-interpreter "/usr/local/bin/python3")

  ;; ===========================================================================
  ;;                groovy config
  ;; ===========================================================================

  ;; groovy indent setting
  (setq groovy-indent-offset 2)

  ;; ===========================================================================
  ;;                rust config
  ;; ===========================================================================
  ; (require 'rust-mode)

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
  (setq plantuml-jar-path "~/.spacemacs.d/plantuml.jar")
  (setq org-plantuml-jar-path plantuml-jar-path)
  (setq org-ditaa-jar-path "~/.spacemacs.d/ditaa.jar")

  ;; Set the hidden font style mark, the direct effect
  (setq org-hide-emphasis-markers t)

  ;; Set to prevent editing of invisible text
  (setq org-catch-invisible-edits 'error)

  ;; The setting code is highlighted
  (setq org-src-fontify-natively t)

  ;; simple template
  (require 'org-tempo)

  ;; https://github.com/syl20bnr/spacemacs/commit/145126875731e8ee38770b2adf709805f23672f7
  ;; https://github.com/integral-dw/org-superstar-mode#hide-leading-stars
  ;; This is usually the default, but keep in mind it must be nil
  (setq org-hide-leading-stars nil)
  ;; This line is necessary.
  (setq org-superstar-leading-bullet ?\s)
  ;; https://github.com/integral-dw/org-superstar-mode#org-superstar-prettify-item-bullets
  (setq org-superstar-prettify-item-bullets nil)
  ;; system time locale
  (setq system-time-locale "zh_CN.UTF-8")

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
  (setq org-task-file "~/record/task/jobt.org")
  (setq org-idea-file "~/record/idea/jobi.org")

  ;; https://www.zmonster.me/2018/02/28/org-mode-capture.html
   (setq org-capture-templates
        '(("t" "Task" entry (file+headline org-task-file "Task")
           "* TODO [#B] %^{HEADLINE} %^g\n  %?"
           :empty-lines 1)
          ("i" "Idea")
          ("io" "Idea.O" entry (file org-idea-file)
           "* Idea.O %^{HEADLINE}\n  %?"
           :empty-lines 1)
          ("is" "Idea.S" entry (file org-idea-file)
           "* Idea.S %^{HEADLINE}\n  %?"
           :empty-lines 1)))

  ;; org-refile setting
  (setq org-refile-targets
        '((org-agenda-files . (:tag . "part"))
          (nil              . (:level . 1))))

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
  ;;   major-modes
  ;; ===========================================================================

  (setq thrift-indent-level 4)

  ;; ===========================================================================
  ;;                html, css, js, json config
  ;; ===========================================================================

  ;; css offset
  (setq css-indent-offset 2)

  ;; javascript offset
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)

  ;; web-mode theme
  (with-eval-after-load 'web-mode
    (set-face-attribute 'web-mode-doctype-face nil :foreground "#586e75")
    (set-face-attribute 'web-mode-html-tag-face nil :foreground "#859900")
    (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#586e75")
    (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#268bd2")
    (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#2aa198")
    (set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "#268bd2")
    (set-face-attribute 'web-mode-html-tag-custom-face nil :foreground "#859900"))

  ;; indentation settings
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  ;; colorization config
  (setq web-mode-enable-css-colorization t)

  ;; ===========================================================================
  ;;                my ivy function
  ;; ===========================================================================

  (defun rgb-24bit/insert-around-word-or-region (text)
    "The inserted content surrounds the word or region."
    (interactive "sInsert: ")
    (let (start end bds)
      (if (and transient-mark-mode mark-active)
          (progn
            (setq start (region-beginning))
            (setq end (region-end)))
        (progn
          (setq bds (bounds-of-thing-at-point 'symbol))
          (setq start (cdr bds))
          (setq end (car bds))))
      (goto-char start) (insert text)
      (goto-char end) (insert text)))

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

  ;; https://tex.stackexchange.com/questions/21200/auctex-and-xetex
  (setq-default TeX-engine 'xetex)
  )

(unless (advice-member-p 'dotspacemacs/user-config #'advice--dotspacemacs/user-config)
  (advice-add 'dotspacemacs/user-config :after #'advice--dotspacemacs/user-config))

;;; for-env-template.el ends here
