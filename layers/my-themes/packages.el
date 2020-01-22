;;; packages.el --- my-themes layer packages file for Spacemacs.

(defconst my-themes-packages
  '((color-theme-sanityinc-solarized :location local)
    dashboard
    ))

(defun my-themes/init-color-theme-sanityinc-solarized ()
  (use-package color-theme-sanityinc-solarized))

(defun my-themes/init-dashboard ()
  (use-package dashboard
    :config
    (progn
      ;; setup dashboard
      (dashboard-setup-startup-hook)
      ;; Set the title
      (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")

      ;; Set the banner
      (setq dashboard-startup-banner 'logo)
      ;; Value can be
      ;; 'official which displays the official emacs logo
      ;; 'logo which displays an alternative emacs logo
      ;; 1, 2 or 3 which displays one of the text banners
      ;; "path/to/your/image.png" which displays whatever image you would prefer

      ;; Content is not centered by default. To center, set
      (setq dashboard-center-content t)

      ;; To disable shortcut "jump" indicators for each section, set
      (setq dashboard-show-shortcuts nil)

      ;; items
      (setq dashboard-items '((recents  . 5)
                              (projects . 5))))))

;;; packages.el ends here
