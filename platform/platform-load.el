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

(defconst spacemacs-private-platform-startup-file
  (concat spacemacs-private-platform-directory "platform.el")
  "Save the platform-specific configuration file.")

(defun spacemacs-private-find-startup-file ()
  "Open the appropriate platform configuration file."
  (interactive)
  (find-file-existing spacemacs-private-platform-startup-file))

;; Load the platform configuration
(load spacemacs-private-platform-startup-file nil (not init-file-debug))

;; Layers related variable loading
(spacemacs-private-for-platform/layers)

;; init related variable loading
(spacemacs-private-for-platform/init)

;;; platform-load.el ends here
