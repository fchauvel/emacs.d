;; Configuration for Javascript


(use-package js2-mode :ensure t :defer 20
  :mode (("\\.js\\'" . js2-mode))
  :hook ((js2-mode-hook . lsp-mode)
         (js2-mode-hook . company-mode))
  )
