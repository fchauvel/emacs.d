;; Configuration for LaTeX editing


(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . LaTeX-mode))


(use-package reftex
  :defer t
  :config
  (setq reftex-default-bibliography "~/Documents/home/pub/sindit/references.bib")
  :commands turn-on-reftex)


(use-package auctex
  :ensure t
  :config
  (setq TeX-master nil)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-parse-self t)
  (setq TeX-auto-save t)
  :hook (LaTeX-mode-hook . 'turn-on-reftex))


(use-package math-symbol-lists
  :ensure t)

(use-package company-math
  :ensure t
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  (add-to-list 'company-backends 'company-math-symbols-latex))


(use-package company-bibtex
  :ensure t
  :after
  (add-to-list 'company-backends 'company-bibtex))


(use-package company-reftex
  :ensure t
  :init
  (setq company-bibtex-bibliography "./references.bib")
  (add-to-list 'company-backends 'company-reftex-labels)
  (add-to-list 'company-backends 'company-reftex-citations))


(use-package company-auctex
  :ensure t
  :config (company-auctex-init))
