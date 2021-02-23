;; Configuration for Python development

(use-package python
  :ensure t
  :commands python-mode
  :interpreter ("python" . python-mode))


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
