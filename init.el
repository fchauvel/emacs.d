;; Setup Melpa & refresh the packages info
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)
(package-initialize)


;; Install use-package if not available
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Persist the mini-buffer command histor
(savehist-mode 1)


;; Look & Feel
(load-file "~/.emacs.d/appearence.el")


;; No tabs by default
(setq-default indent-tabs-mode nil)

;; Whitespace in programming
(require 'whitespace)
(add-hook 'prog-mode-hook
           (lambda ()
             (whitespace-mode)))


;; White space cleanup on save / in prog
mode
(add-hook 'before-save-hook
           (lambda ()
             (unless indent-tabs-mode
               (untabify (point-min) (point-max)))
             (when (derived-mode-p 'prog-mode)
               (whitespace-cleanup))))


;; Auto-completion
(use-package company
  :ensure t
  :bind (:map company-active-map ("<tab>" . compagny-complete-common-or-cycle))
  :custom
  (company-idle-delay 0.0 "Recommended by lsp")
  :hook (prog-mode-hook . company-mode))



;; Indentation as you type
(use-package aggressive-indent
  :ensure t
  :hook (prog-mode . aggressive-indent-mode))


;; Git
(load-file "~/.emacs.d/git.el")

;; LaTeX
(load-file "~/.emacs.d/latex.el")

;; YAML
(use-package yaml-mode
  :ensure t
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
  :hook (typescript-mode-hook .
                              (lambda ()
                                (make-local-variable 'indent-tabs-mode)
                                (setq indent-tabs-mode nil)
                                (whitespace-mode)))
  )

;; Flyspell
(use-package flyspell
  :ensure t
  :hook
  (text-mode . turn-on-flyspell)
  (tex-mode . turn-on-flyspell)
  (prog-mode . flyspell-prog-mode))


;; Load windows configuration if needed
(if (eq system-type 'windows-nt)
    (load-file "~/.emacs.d/windows.el"))


;; -- End of customization -------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("039c01abb72985a21f4423dd480ddb998c57d665687786abd4e16c71128ef6ad" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(package-selected-packages
   '(rainbow-mode rainbow-blocks rainbow-block leuven-theme molokai-theme beacon flycheck flyspell aggressive-indent company-reftex company-bibtex company-auctex auto-dictionary auctex LaTeX indent-guide rainbow-delimiters lsp-python-ms lsp-ui lsp-treemacs lsp-dart dart-mode csv-mode yaml-mode typescript-mode ssh-agency markdown-mode magit helm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
