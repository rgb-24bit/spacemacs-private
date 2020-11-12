;;; packages.el --- my-git layer packages file for Spacemacs.

(defconst my-git-packages '(magit))

(defun my-git/post-init-magit ()
  (with-eval-after-load 'magit
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
    ))


;;; packages.el ends here
