;;; platform.el --- Platform Configuration Template

(defun spacemacs-private-for-platform/layers ()
  "Configuration layers for the appropriate platform."
  (setq-default
   ;; List of configuration layers to load.
   spacemacs-private/dotspacemacs-configuration-layers
   '()

   ;; A list of packages that will not be installed and loaded.
   spacemacs-private/dotspacemacs-excluded-packages
   '()
   ))

(defun spacemacs-private-for-platform/user-init()
  "Configuring user initialization for the appropriate platform."
  )

(defun spacemacs-private-for-platform/user-config ()
  "Configuring user configuration for the appropriate platform."
  )

;;; platform.el ends here
