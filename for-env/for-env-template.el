;;; for-env-template.el --- Configuration template for an environment

;; =============================================================================
;;                  advice for dotspacemacs/layers
;; =============================================================================

(defun advice--dotspacemacs/layers ()
  "Advice for function `dotspacemacs/layers'."
  (setq-default
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers '(emacs-lisp)

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   )
  )

(unless (advice-member-p 'dotspacemacs/layers #'advice--dotspacemacs/layers)
  (advice-add 'dotspacemacs/layers :after #'advice--dotspacemacs/layers))

;; =============================================================================
;;                  advice for dotspacemacs/init
;; =============================================================================

(defun advice--dotspacemacs/init ()
  "Advice for function `dotspacemacs/init'."
  (setq-default
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   spacemacs/dotspacemacs-themes '()

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   spacemacs/dotspacemacs-default-font nil
   )
  )

(unless (advice-member-p 'dotspacemacs/init #'advice--dotspacemacs/init)
  (advice-add 'dotspacemacs/init :after #'advice--dotspacemacs/init))

;; =============================================================================
;;                  advice for dotspacemacs/user-init
;; =============================================================================

(defun advice--dotspacemacs/user-init ()
  "Advice for function `dotspacemacs/user-init'."
  )

(unless (advice-member-p 'dotspacemacs/user-init #'advice--dotspacemacs/user-init)
  (advice-add 'dotspacemacs/user-init :after #'advice--dotspacemacs/user-init))

;; =============================================================================
;;                  advice for dotspacemacs/user-config
;; =============================================================================

(defun advice--dotspacemacs/user-config ()
  "Advice for function `dotspacemacs/user-config'."
  )

(unless (advice-member-p 'dotspacemacs/user-config #'advice--dotspacemacs/user-config)
  (advice-add 'dotspacemacs/user-config :after #'advice--dotspacemacs/user-config))

;;; for-env-template.el ends here
