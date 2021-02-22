;; Setup Melpa and Install use-package
(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives
		'("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))


;; Disable the bell
(setq ring-bell-function 'ignore)

;; Highlight current line mode globally
(global-hl-line-mode 1)

;; Theme
(use-package spacemacs-theme
  :ensure t
  :after (load-theme 'spacemacs-light t))

;; Whitespace in programming
(require 'whitespace)
(add-hook 'prog-mode-hook
	  (lambda ()
	    (whitespace-mode)))

;; White space cleanup on save / in prog  mode
(add-hook 'before-save-hook
	  (lambda ()
	    (when (derived-mode-p 'prog-mode)
	      (whitespace-cleanup))))


;; Auto-completion
(use-package company
  :ensure t
  :init
  (global-company-mode))

;; Rainbow delimiters
(use-package rainbow-delimiters
  :ensure t
  :init
  :hook (prog-mode . rainbow-delimiters-mode))

;; Indentation as you type
(use-package aggressive-indent
  :hook (prog-mode . aggressive-indent-mode))

;; Indent guide
(use-package indent-guide
  :ensure t
  :init
  (progn
    (indent-guide-global-mode)
    (setq indent-guide-recursive t)))

;; Magit
(use-package magit
  :ensure t)


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

;; Load windows configuration if needed
(if (eq system-type 'windows-nt)
    (load-file "~/.emacs.d/windows.el"))


;; -- End of customization -------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-reftex company-bibtex company-auctex auto-dictionary auctex LaTeX indent-guide rainbow-delimiters lsp-python-ms lsp-ui lsp-treemacs lsp-dart dart-mode csv-mode yaml-mode typescript-mode ssh-agency markdown-mode magit helm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
