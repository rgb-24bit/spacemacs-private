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
   spacemacs-private/dotspacemacs-configuration-layers '()

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   spacemacs-private/dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   spacemacs-private/dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   spacemacs-private/dotspacemacs-excluded-packages '()
   ))

(defun spacemacs-private/init ()
  "Configuring spacemacs initialization configuration."
  (setq-default
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   spacemacs-private/dotspacemacs-themes '()

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   spacemacs-private/dotspacemacs-default-font nil
  ))

(defun spacemacs-private-for-platform/user-init()
  "Configuring user initialization for the appropriate platform."
  )

(defun spacemacs-private-for-platform/user-config ()
  "Configuring user configuration for the appropriate platform."
  )

;;; platform.el ends here
