;;; platform.el --- MacOS platform configuration

(defun spacemacs-private-for-platform/layers ()
  "Configuration layers for the appropriate platform."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   spacemacs-private/dotspacemacs-distribution 'spacemacs

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   spacemacs-private/dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")

   ;; List of configuration layers to load.
   spacemacs-private/dotspacemacs-configuration-layers
   '(
     ;; completion layers
     auto-completion
     helm
     ivy

     ;; source control layers
     git

     ;; emacs layers
     better-defaults
     (ibuffer :variables ibuffer-group-buffers-by 'nil)

     ;; tools layers
     (lsp :variables
          lsp-ui-doc-enable nil)

     docker
     nginx
     (shell :variables
            shell-default-position 'bottom)

     csv
     emacs-lisp
     json
     (python :variables
             python-backend 'lsp)
     shell-scripts
     (sql :variables
          sql-capitalize-keywords t)
     yaml

     ;; my layers
     my-utils
     )

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
   spacemacs-private/dotspacemacs-excluded-packages
   '(
     ;; auto-completion
     yasnippet-snippets
     )
   ))

(defun spacemacs-private-for-platform/init ()
  "Configuring spacemacs initialization configuration."
  (setq-default
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   spacemacs-private/dotspacemacs-themes (if (display-graphic-p)
                                             '((sanityinc-solarized-dark
                                                :location (recipe :fetcher github
                                                                  :repo "rgb-24bit/color-theme-sanityinc-solarized"))
                                               (sanityinc-solarized-light
                                                :location (recipe :fetcher github
                                                                  :repo "rgb-24bit/color-theme-sanityinc-solarized"))
                                               spacemacs-dark
                                               spacemacs-light)
                                           '(sanityinc-tomorrow-eighties
                                             sanityinc-tomorrow-night
                                             spacemacs-dark
                                             spacemacs-light))

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   spacemacs-private/dotspacemacs-default-font '("Source Code Pro"
                                                 :size 10.0
                                                 :weight normal
                                                 :width normal)
  ))

(defun spacemacs-private-for-platform/user-init()
  "Configuring user initialization for the appropriate platform."
  )

(defun spacemacs-private-for-platform/user-config ()
  "Configuring user configuration for the appropriate platform."
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
  ;; Python config
  ;; ===========================================================================

  ;; python indentation style settings
  (setq python-indent-offset 4
        python-indent-guess-indent-offset nil
        python-indent-guess-indent-offset-verbose nil)

  ;; ===========================================================================
  ;; Json config
  ;; ===========================================================================

  ;; javascript offset
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)
  )

;;; platform.el ends here
