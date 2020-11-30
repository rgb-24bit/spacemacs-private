;;; packages.el --- my-org layer packages file for Spacemacs.

(defconst my-org-packages
  '((org :location built-in)))

(defun my-org/post-init-org ()
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

  ;; stop org from coloring the whole headline after setting a todo to done.
  (setq org-fontify-done-headline nil)

  ;; https://github.com/syl20bnr/spacemacs/commit/145126875731e8ee38770b2adf709805f23672f7
  ;; https://github.com/integral-dw/org-superstar-mode#hide-leading-stars
  ;; This is usually the default, but keep in mind it must be nil
  (setq org-hide-leading-stars nil)
  ;; This line is necessary.
  (setq org-superstar-leading-bullet ?\s)
  ;; https://github.com/integral-dw/org-superstar-mode#org-superstar-prettify-item-bullets
  (setq org-superstar-prettify-item-bullets nil)

  ;; https://www.zmonster.me/2018/02/28/org-mode-capture.html
  (when (and org-task-file org-idea-file)
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
             :empty-lines 1))))

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

      ;; simple template
      (require 'org-tempo)

      ;; ;; Convenient timing
      ;; (org-defkey org-mode-map [(f5)] 'org-clock-in)
      ;; (org-defkey org-mode-map [(f8)] 'org-clock-out)
      ))
  )

;;; packages.el ends here

