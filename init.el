;; Setup Melpa & refresh the packages info

(when (version< emacs-version "27.0" )
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(require 'package)
(add-to-list 'package-archives
            '("melpa" . "https://melpa.org/packages/") t);

(unless package-archive-contents
 (package-initialize)
 (package-refresh-contents))
(unless (package-installed-p 'use-package)
 (package-install 'use-package))
(setq use-package-always-ensure t)

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
(setq split-height-threshold 2000
      split-width-threshold 100)

;; Navigation & Shortcuts
(org-babel-load-file "~/.emacs.d/navigation.org")

;; Look & Feel
(load-file "~/.emacs.d/appearance.el")

;; Common settings for multiple programming languages
(org-babel-load-file "~/.emacs.d/ide.org")

;; Common settings for multiple programming languages
(org-babel-load-file "~/.emacs.d/java.org")

;; Git
(load-file "~/.emacs.d/git.el")

;; Lisp / Scheme
;;(load-file "~/.emacs.d/scheme.el")

;; LaTeX
;; (load-file "~/.emacs.d/latex.el")

;; Python
(load-file "~/.emacs.d/python.el")

;; Dart & Flutter
;;(load-file "~/.emacs.d/flutter.el")

;; Weh / HTML
;;(load-file "~/.emacs.d/web.el")

;; JavaScript
;;(load-file "~/.emacs.d/js.el")

;; Typescript
(load-file "~/.emacs.d/typescript.el")

;; Org-Mode
(load-file "~/.emacs.d/org.el")

;; R
(load-file "~/.emacs.d/r.el")

;; Fuzzy Matching
(use-package helm
  :demand t
  :bind ("M-x" . helm-M-x)
  :config (helm-mode 1))


;; YAML
(use-package yaml-mode
 :ensure t
 :defer t
 :mode ("\\.yml$" . yaml-mode))


;; Markdown
(use-package markdown-mode
 :mode (("\\.markdown$" . markdown-mode)
        ("\\.md$" . markdown-mode))
 :hook (markdown-mode-hook . (lambda ()
                               (make-local-variable 'indent-tabs-mode)
                               (setq indent-tabs-mode nil)
                               (whitespace-mode)))
 :init (setq markdown-command "multimarkdown"))



;; Dockerfile
(use-package dockerfile-mode
 :ensure t
 :defer t)


;; Flyspell
(use-package flyspell
 :ensure t
 :defer t
 :init (setq ispell-program-name "/opt/homebrew/bin/ispell")
 :hook
 (text-mode . turn-on-flyspell)
 (tex-mode . turn-on-flyspell)
 (prog-mode . flyspell-prog-mode))


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
