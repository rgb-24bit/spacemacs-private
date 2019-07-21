;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs-base

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation nil

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation nil

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; spacemacs layers
     spacemacs-completion
     spacemacs-editing
     spacemacs-editing-visual
     spacemacs-modeline
     spacemacs-navigation
     spacemacs-org
     spacemacs-project
     spacemacs-visual

     ;; completion layers
     auto-completion
     helm
     ivy

     ;; source control layers
     git

     ;; emacs layers
     better-defaults
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     org

     ;; tools layers
     lsp
     command-log
     finance
     (osx :variables
          osx-command-as       'meta
          osx-option-as        'hyper
          osx-control-as       'control
          osx-function-as      'control
          osx-right-command-as 'left
          osx-right-option-as  'left
          osx-right-control-as 'left
          osx-swap-option-and-command nil)
     (shell :variables
            shell-default-position 'full)

     ;; lang layers
     csv
     emacs-lisp
     html
     json
     markdown
     plantuml
     (python :variables
             python-backend 'anaconda)
     shell-scripts
     (sql :variables
          sql-capitalize-keywords t)
     yaml

     ;; my layers
     my-packages
     my-utils
     )

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
   dotspacemacs-excluded-packages
   '(
     ;; auto-completion
     yasnippet-snippets
     )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'lisp-interaction-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-solarized-dark
                         sanityinc-solarized-light
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator arrow :separator-scale 1.0)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font nil

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "rgb-24bit's %I"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  ;; ===========================================================================
  ;; ELPA Mirror Settings (Mirror Source for Emacs China)
  ;; ===========================================================================

  (setq configuration-layer-elpa-archives
        '(("melpa-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ("gnu-tuna"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
          ("melpa-cn"   . "http://elpa.emacs-china.org/melpa/")
          ("org-cn"     . "http://elpa.emacs-china.org/org/")
          ("gnu-cn"     . "http://elpa.emacs-china.org/gnu/")))

  ;; ===========================================================================
  ;; chinese and english font config
  ;; ===========================================================================

  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-Source Code Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
                    :weight 'normal
                    :slant 'normal
                    :size 14))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-*-STKaiti-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
                :weight 'normal
                :slant 'normal
                :size 16.5)))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  ;; ===========================================================================
  ;;                spacemacs config
  ;; ===========================================================================

  ;; windows system encoding format settings
  (when (eq system-type 'windows-nt)
    (setq-default w32-system-coding-system 'cp936-dos))

  ;; no minor-modes
  (spacemacs/toggle-mode-line-minor-modes-off)

  ;; Display datetime in mode line
  ;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Time-Parsing.html
  (spaceline-define-segment datetime
    (format-time-string "%m-%d %k:%M"))
  (spaceline-spacemacs-theme 'datetime)

  ;; User info
  (setq user-full-name "rgb-24bit")
  (setq user-mail-address "rgb-24bit@foxmail.com")

  ;; linumer align right
  (setq display-line-numbers-width-start t)

  (defun rgb-24bit/insert-around-word-or-region (text)
    "The inserted content surrounds the word or region."
    (interactive "sInsert: ")
    (let (start end bds)
      (if (and transient-mark-mode mark-active)
          (progn
            (setq start (region-beginning))
            (setq end (region-end)))
        (progn
          (setq bds (bounds-of-thing-at-point 'symbol))
          (setq start (cdr bds))
          (setq end (car bds))))
      (goto-char start) (insert text)
      (goto-char end) (insert text)))

  ;; Minimize frame when editing is complete
  ;; Refrence:
  ;;    https://www.emacswiki.org/emacs/EmacsClient
  ;;    https://www.emacswiki.org/emacs/YesOrNoP
  (defun rgb-24bit/server-done ()
    "Minimize frame when editing is complete."
    (if (y-or-n-p "Whether to minimize the frame ?")
        (suspend-frame)))

  ;; use emacsclient -c is better
  ;; (add-hook 'server-done-hook 'rgb-24bit/server-done)

  ;; ===========================================================================
  ;; Magit config
  ;; ===========================================================================

  ;; repository list config
  (setq magit-repository-directories
        '(("~/rgbit" . 1)
          ("~/job"   . 1)))

  ;; ===========================================================================
  ;;                coding config
  ;; ===========================================================================

  ;; https://www.emacswiki.org/emacs/ChangingEncodings
  (modify-coding-system-alist 'file "\\.sh\\'" 'unix)

  ;; ===========================================================================
  ;;                ibuffer config
  ;; ===========================================================================

  ;;  make ibuffer default
  ;; (defalias 'list-buffers 'ibuffer)

  ;; hide all buffers starting with an asterisk
  ;; (require 'ibuf-ext)
  ;; (add-to-list 'ibuffer-never-show-predicates "^\\*")

  ;; ===========================================================================
  ;;                dired-x config
  ;; ===========================================================================

  ;; https://github.com/syl20bnr/spacemacs/issues/9813
  (require 'dired-x)

  ;; More friendly file size display
  (setq-default dired-listing-switches "-alh")

  ;; ===========================================================================
  ;;                c-c++ config
  ;; ===========================================================================

  ;; c-c++ indentation style settings
  (setq c-default-style "linux"
        c-basic-offset 2)

  ;; https://emacs-china.org/t/topic/5319
  ;; (setq-default sp-autoinsert-pair nil
  ;;               sp-autodelete-pair nil
  ;;               sp-autoskip-closing-pair nil
  ;;               sp-escape-quotes-after-insert nil)

  ;; comments style setting
  (add-hook 'c-mode-hook (lambda () (c-toggle-comment-style)))

  ;; ===========================================================================
  ;;                python config
  ;; ===========================================================================

  ;; python indentation style settings
  (setq python-indent-offset 4
        python-indent-guess-indent-offset nil
        python-indent-guess-indent-offset-verbose nil)

  ;; fix elpy bug
  (setq python-shell-completion-native-enable nil)

  ;; ===========================================================================
  ;;                groovy config
  ;; ===========================================================================

  ;; groovy indent setting
  (setq groovy-indent-offset 2)

  ;; ===========================================================================
  ;;                org config
  ;; ===========================================================================

  ;; org-mode programming language support settings
  (setq org-babel-load-languages
        '((C          . t)
          (sql        . t)
          (java       . t)
          (ledger     . t)
          (latex      . t)
          (sqlite     . t)
          (python     . t)
          (plantuml   . t)
          (emacs-lisp . t)
          (octave     . t)
          (dot        . t)
          (ditaa      . t)))

  ;; plantuml.jar and ditaa.jar path setting
  (setq org-plantuml-jar-path
        (expand-file-name "~/.spacemacs.d/plantuml.jar"))
  (setq org-ditaa-jar-path "~/.spacemacs.d/ditaa.jar")

  ;; Set the hidden font style mark, the direct effect
  (setq org-hide-emphasis-markers t)

  ;; Set to prevent editing of invisible text
  (setq org-catch-invisible-edits 'error)

  ;; The setting code is highlighted
  (setq org-src-fontify-natively t)

  ;; simple template'
  (require 'org-tempo)

  ;; Some config
  (with-eval-after-load 'org
    (progn
      ;; ===========================================================================
      ;; org-mode gtd state settings
      ;; @ /! Switch to this state will be prompted to enter
      ;; ===========================================================================

      (setq org-todo-keywords
            '((sequence "TODO(t!)" "NEXT(n)" "WAIT(w)" "|" "DONE(d@/!)" "ABORT(a@/!)")))

      ;; (let ((red "#dc322f") (green "#859900") (blue "#268bd2") (violet "#6c71c4"))
      ;;   (setq org-todo-keyword-faces
      ;;         `(("TODO"     . ,red)
      ;;           ("NEXT"     . ,red)
      ;;           ("WAITTING" . ,violet)
      ;;           ("SOMEDAY"  . ,blue)
      ;;           ("MAYBE"    . ,blue)
      ;;           ("DONE"     . ,green)
      ;;           ("ABORT"    . ,green))))

      ;; M-RET keybinding set
      (org-defkey org-mode-map [(meta return)] 'org-meta-return)

      ;; Convenient timing
      (org-defkey org-mode-map [(f5)] 'org-clock-in)
      (org-defkey org-mode-map [(f8)] 'org-clock-out)))

  ;; Org-capture template settings
  (setq org-task-file "~/rgbit/record/task/jobt.org")
  (setq org-idea-file "~/rgbit/record/idea/jobi.org")

  (setq org-capture-templates
        '(("t" "Task" entry (file+headline org-task-file "Task")
           "* TODO [#B] %^{HEADLINE} %^g\n  %?"
           :empty-lines 1)
          ("d" "Done" entry (file+headline org-task-file "Done")
           "* DONE %^{HEADLINE} %^g\n  %?"
           :empty-lines 1)
          ("i" "Idea" entry (file+headline org-idea-file "Idea")
           "* %^{HEADLINE}\n  %?"
           :empty-lines 1)))

  ;; clock table group by tags
  ;; https://gist.github.com/rgb-24bit/deaa3ac4fe588cab7d2661fa69a4439b
  (defun clocktable-by-tag/shift-cell (n)
    (let ((str ""))
      (dotimes (i n)
        (setq str (concat str "| ")))
      str))

  (defun clocktable-by-tag/insert-tag (params)
    (let ((tag (plist-get params :tags)))
      (insert "|--\n")
      (insert (format "| %s | *Tag time* |\n" tag))
      (insert "|--\n")
      (let ((total 0))
        ;;      (mapcar
        (mapc
         (lambda (file)
           (let ((clock-data (with-current-buffer (find-file-noselect file)
                               (org-clock-get-table-data (buffer-name) params))))
             (when (> (nth 1 clock-data) 0)
               (setq total (+ total (nth 1 clock-data)))
               ;; (insert (format "| | File *%s* | %.2f |\n"
               ;;                 (file-name-nondirectory file)
               ;;                 (/ (nth 1 clock-data) 60.0)))
               (dolist (entry (nth 2 clock-data))
                 (insert (format "| | %s%s | %s %.2f |\n"
                                 (org-clocktable-indent-string (nth 0 entry))
                                 (nth 1 entry)
                                 (clocktable-by-tag/shift-cell (nth 0 entry))
                                 (/ (nth 3 entry) 60.0)))))))
         `(,buffer-file-name))
        (save-excursion
          (re-search-backward "*Tag time*")
          (org-table-next-field)
          (org-table-blank-field)
          (insert (format "*%.2f*" (/ total 60.0)))))
      (org-table-align)))

  (defun org-dblock-write:clocktable-by-tag (params)
    (insert "| Tag | Headline | Time (h) |\n")
    ;; (insert "|     |          | <r>  |\n")
    (let ((tags (plist-get params :tags)))
      (mapcar (lambda (tag)
                (setq params (plist-put params :tags tag))
                (clocktable-by-tag/insert-tag params))
              tags)))

  (defun rgb-24bit/insert-clock-entry ()
    "Insert a clock entity."
    (interactive)
    (org-clock-in)
    (org-clock-out))

  (defun rgb-24bit/org-delete-element ()
    "Delete org element."
    (interactive)
    (org-mark-element)
    (kill-region (region-beginning) (region-end)))

  ;; ===========================================================================
  ;;                html, css, js, json config
  ;; ===========================================================================

  ;; css offset
  (setq css-indent-offset 2)

  ;; javascript offset
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)

  ;; web-mode theme
  (with-eval-after-load 'web-mode
    (set-face-attribute 'web-mode-doctype-face nil :foreground "#586e75")
    (set-face-attribute 'web-mode-html-tag-face nil :foreground "#859900")
    (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#586e75")
    (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#268bd2")
    (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#2aa198")
    (set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "#268bd2")
    (set-face-attribute 'web-mode-html-tag-custom-face nil :foreground "#859900"))

  ;; indentation settings
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  ;; colorization config
  (setq web-mode-enable-css-colorization t)

  ;; ===========================================================================
  ;;                my ivy function
  ;; ===========================================================================

  (defun rgb-24bit/insert-keybinding (key)
    "Insert key binding string."
    (interactive "kType key sequence: ")
    (if (null (equal key "\r"))
        (insert (help-key-description key nil))))

  (defun rgb-24bit/ivy-read ()
    "Used to call my own defined function."
    (interactive)
    (ivy-read "Function:"
              '(rgb-24bit/insert-clock-entry
                rgb-24bit/insert-around-word-or-region
                rgb-24bit/org-delete-element
                rgb-24bit/insert-keybinding
                )
              :action (lambda (x)
                        (command-execute
                         (intern x)))))

  (global-set-key (kbd "M-n") 'rgb-24bit/ivy-read)


  ;; ===========================================================================
  ;;                latex config
  ;; ===========================================================================

  ;; https://stackoverflow.com/questions/2477195/latex-indentation-formatting-in-emacs
  (setq LaTeX-item-indent 0)

  ;; ===========================================================================
  ;;                custom file config
  ;; ===========================================================================

  (setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
  (load custom-file 'no-error 'no-message)
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(package-selected-packages
     (quote
      (winum wgrep web-mode toc-org sql-indent spaceline-all-the-icons spaceline powerline smartparens plantuml-mode pipenv pyvenv paradox org-projectile projectile org-pomodoro alert org-mime org-download org-brain nameless mwim lsp-ui live-py-mode link-hint js2-mode ivy-hydra hl-todo highlight-indentation helm-make groovy-mode graphviz-dot-mode expand-region eval-sexp-fu editorconfig doom-modeline all-the-icons cython-mode counsel swiper company-lsp lsp-mode ht color-theme-sanityinc-solarized cnfonts centered-cursor-mode auto-yasnippet auto-compile aggressive-indent ace-window ace-link avy anaconda-mode pythonic auctex company yasnippet ivy markdown-mode f dash which-key use-package hydra lv async evil goto-chg yapfify yaml-mode ws-butler web-beautify volatile-highlights uuidgen unfill undo-tree symon string-inflection sqlup-mode spinner smex shrink-path restart-emacs rainbow-delimiters pytest py-isort popwin pippel pip-requirements pcre2el password-generator packed overseer origami org-present org-category-capture org-bullets open-junk-file move-text mmm-mode memoize markdown-toc macrostep lorem-ipsum log4e js-doc ivy-yasnippet ivy-xref indent-guide importmagic hungry-delete htmlize highlight-parentheses highlight-numbers highlight helm groovy-imports google-c-style golden-ratio gnuplot gntp gh-md fuzzy font-lock+ flycheck flx-ido fill-column-indicator fancy-battery evil-org emmet-mode elisp-slime-nav eldoc-eval edit-indirect dotenv-mode disaster diminish csharp-mode company-web company-tern company-statistics company-c-headers company-auctex company-anaconda command-log-mode column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol ac-ispell))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
