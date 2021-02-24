;; Package that are common to several programming languages

(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp)))

;; UI for LSP
(use-package lsp-ui
  :ensure t
  :hook ((lsp-mode-hook .lsp-ui-mode)))


;; Project Management
(use-package projectile
  :ensure t)
