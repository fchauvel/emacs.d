;; Configuration for Python development

(use-package python
  :ensure t
  :commands python-mode
  :interpreter ("python" . python-mode)
  :init (setq flycheck-highlighting-mode 'lines
              flycheck-check-syntax-automatically '(save idle-change mode-enabled)
              flycheck-idle-change-delay 4))

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp))))  ; or lsp-deferred

(use-package pyvenv
  :ensure t
  :config
  (setq pyvenv-workon "emacs")  ; Default venv
  (pyvenv-tracking-mode 1))


(use-package company-quickhelp
  :ensure t
  :init
  (company-quickhelp-mode)
  )
