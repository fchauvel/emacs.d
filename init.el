;; Setup Melpa & refresh the packages info
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(when (not package-archive-contents)
  (package-refresh-contents))
(package-initialize)

;; Install use-package if not available
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Update packages automatically
(use-package auto-package-update
  :ensure t
  :defer t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))


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


;; Look & Feel
(load-file "~/.emacs.d/appearence.el")


;; No tabs by default
(setq-default indent-tabs-mode nil)



;; Whitespace in programming
(require 'whitespace)
(add-hook 'prog-mode-hook
          (lambda ()
            (whitespace-mode)))


;; White space cleanup on save / in prog-mode
(add-hook 'before-save-hook
          (lambda ()
            (unless indent-tabs-mode
              (untabify (point-min) (point-max)))
            (when (derived-mode-p 'prog-mode)
              (whitespace-cleanup))))


;; Indentation as you type
(use-package aggressive-indent
  :ensure t
  :defer t)

;; Git
(load-file "~/.emacs.d/git.el")

;; Common settings for multiple programming languages
(load-file "~/.emacs.d/commons.el")

;; LaTeX
(load-file "~/.emacs.d/latex.el")

;; Python
(load-file "~/.emacs.d/python.el")

;; Dart & Flutter
(load-file "~/.emacs.d/flutter.el")


;; Auto-completion
(use-package company
  :ensure t
  :defer t
  :custom
  (company-idle-delay 0.0 "Recommended by lsp")
  :init (global-company-mode 1))


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
  )


;; Typescript
(use-package typescript-mode
  :ensure t
  :defer t
  :hook (typescript-mode-hook .
                              (lambda ()
                                (make-local-variable 'indent-tabs-mode)
                                (setq indent-tabs-mode nil)
                                (whitespace-mode)))
  )

;; Flyspell
(use-package flyspell
  :ensure t
  :defer t
  :hook
  (text-mode . turn-on-flyspell)
  (tex-mode . turn-on-flyspell)
  (prog-mode . flyspell-prog-mode))


;; Load windows configuration if needed
(if (eq system-type 'windows-nt)
    (load-file "~/.emacs.d/windows.el"))


;; Measure Emacs startup  time
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; -- End of customization -------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "039c01abb72985a21f4423dd480ddb998c57d665687786abd4e16c71128ef6ad" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(package-selected-packages
   '(esup pyvenv jed-core company-jedi auto-package-update smart-mode-line-powerline-theme nlinum nord-theme rainbow-mode rainbow-blocks rainbow-block leuven-theme molokai-theme beacon flycheck flyspell aggressive-indent company-reftex company-bibtex company-auctex auto-dictionary auctex LaTeX indent-guide rainbow-delimiters lsp-python-ms lsp-ui lsp-treemacs lsp-dart dart-mode csv-mode yaml-mode typescript-mode ssh-agency markdown-mode magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
