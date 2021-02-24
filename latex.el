;; Configuration for LaTeX editing


(use-package tex-site
  :ensure auctex
  :defer t
  :mode ("\\.tex\\'" . LaTeX-mode))


(use-package reftex
  :ensure t
  :defer t
  :config
  (setq reftex-default-bibliography nil)
  :commands turn-on-reftex
  :hook ((LaTeX-mode-hook  .  reftex-mode)
         (latex-mode-hook  .  reftex-mode)))


(use-package auctex
  :ensure t
  :defer t
  :mode ("\\.tex\\'" . LaTeX-mode)
  :config
  (setq TeX-master "main.tex")
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-parse-self t)
  (setq TeX-auto-save t))


(use-package math-symbol-lists
  :ensure t
  :defer t)

(use-package company-math
  :ensure t
  :defer t
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  (add-to-list 'company-backends 'company-math-symbols-latex))


(use-package company-bibtex
  :ensure t
  :defer t
  :after
  (add-to-list 'company-backends 'company-bibtex))


(use-package company-reftex
  :ensure t
  :defer t
  :init
  (setq company-bibtex-bibliography "references.bib"))


(use-package company-auctex
  :ensure t
  :defer t
  :init (company-auctex-init))
