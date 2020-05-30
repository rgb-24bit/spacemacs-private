;;; for-env-load.el --- Load configuration for an environment

(defconst dotspacemacs-private-env-name "DOTSPACEMACS_PRIVATE_ENV"
  "Configure environment environment variable name.")

(defconst dotspacemacs-private-env
  (let ((dotspacemacs-env (getenv dotspacemacs-private-env-name)))
    (cond (dotspacemacs-env                dotspacemacs-env)
          ((spacemacs/system-is-mswindows) "windows")
          ((spacemacs/system-is-linux)     "linux")
          ((spacemacs/system-is-mac)       "macos")))
  "Current configuration environment")

(defconst dotspacemacs-private-startup-file
  (concat (file-name-directory load-file-name)
          (format "for-%s.el" dotspacemacs-private-env))
  "Current configuration environment configuration file.")

(defun spacemacs-private-find-startup-file ()
  "Open the current configuration environment configuration file."
  (interactive)
  (find-file-existing dotspacemacs-private-startup-file))

;; Load the current configuration environment configuration file
(load dotspacemacs-private-startup-file
      nil (not init-file-debug))

;;; for-env-load.el ends here
