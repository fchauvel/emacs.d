;; Setup Melpa & refresh the packages info

(when (version< emacs-version "27.0" )
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t);
(add-to-list 'package-archives
             '("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/") t)

(unless package-archive-contents
 (package-initialize)
 (package-refresh-contents))

;; Now shipped with Emacs 29.1
;;(unless (package-installed-p 'use-package)
;;  (package-install 'use-package))

(setq use-package-always-ensure t
      package-install-upgrade-built-in t)

;; Update packages automatically
(use-package auto-package-update
  :defer t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Move all Emacs auto configuration in a separate file
(defvar my/auto-custom-config "~/.emacs.d/custom.el")
(setq custom-file my/auto-custom-config)
(when (file-exists-p my/auto-custom-config)
  (load-file my/auto-custom-config))

;; Move all backup file in a  single location
(defvar my/emacs-backup-directory "~/.emacs.d/backups")
(unless (file-exists-p my/emacs-backup-directory)
  (make-directory my/emacs-backup-directory))
(setq backup-directory-alist `(("." . ,my/emacs-backup-directory)))


;; Restore the open buffers on restart

(defvar franck/desktop-directory "~/.emacs.d/desktop",
  "Hold the directory where Emacs saves the current session's buffers.")

(unless (file-exists-p franck/desktop-directory)
  (make-directory franck/desktop-directory))

(use-package desktop
  :ensure t
  :defer t
  :init
  (setq desktop-path (list franck/desktop-directory)
        desktop-dirname franck/desktop-directory
        desktop-restore-eager 5
        desktop-load-locked-desktop t
        desktop-save t)
  (desktop-save-mode 1))


;; Persist the mini-buffer command history
(savehist-mode 1)


;; Avoid splitting the windows horizontally
(setq split-height-threshold 4000
      split-width-threshold 100)

;; Basic Configuration
(org-babel-load-file "~/.emacs.d/basics.org")

;; Look & Feelx
(org-babel-load-file "~/.emacs.d/theme.org")

;; Navigation & Shortcuts
(org-babel-load-file "~/.emacs.d/navigation.org")

;; Programming
(org-babel-load-file "~/.emacs.d/ide.org")

;; Text editors & Wikis
(org-babel-load-file "~/.emacs.d/text.org")

;; Load specific windows configuration if needed
(if (eq system-type 'windows-nt)
    (load-file "~/.emacs.d/windows.el"))

;; Load specific MacOS configuration if needed
(if (eq system-type 'darwin)
    (load-file "~/.emacs.d/macos.el"))

;; Measure Emacs startup  time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))
(put 'downcase-region 'disabled nil)
