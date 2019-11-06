;;; platform-load.el --- Used to initialize the configuration of different platforms

(defconst spacemacs-private-platform-env (getenv "SPACEMACS_PRIVATE_PLATFORM")
  "Platform configuration from environment variables.")

(defconst spacemacs-private-platform
  (cond (spacemacs-private-platform-env spacemacs-private-platform-env)
        ((spacemacs/system-is-mswindows) "windows")
        ((spacemacs/system-is-linux) "linux")
        ((spacemacs/system-is-mac) "macos"))
  "Current platform configuration.")

(defconst spacemacs-private-platform-directory
  (file-name-as-directory
   (concat (file-name-directory load-file-name) spacemacs-private-platform))
  "Save directory platform configurations")

;; Load the platform configuration
(load (concat spacemacs-private-platform-directory "init.el"))

;; Layers related variable loading
(spacemacs-private-for-platform/layers)

;;; platform-load.el ends here
