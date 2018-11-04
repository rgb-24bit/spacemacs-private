;;; funcs.el --- my-python layer function file for Spacemacs.

(defun my-python/insert-codecell-above ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (insert "# <codecell>\n")))

(defun my-python/insert-markdowncell-above ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (insert "# <markdowncell>\n")))
