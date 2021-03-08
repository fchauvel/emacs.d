;; Package that are common to several programming languages

(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp))
  :config (setq read-process-output-max (* 1024 1024)))


;; UI for LSP
(use-package lsp-ui
  :ensure t
  :hook ((lsp-mode-hook .lsp-ui-mode)))


;; Project Management
(use-package projectile
  :ensure t)
