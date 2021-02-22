;; Configuration for Flutter development

(use-package lsp-mode :ensure t)

;; UI for LSP
(use-package lsp-ui :ensure t)

;; Project Management
(use-package projectile :ensure t)

(use-package lsp-dart
  :ensure t
  :hook (dart-mode . lsp))
