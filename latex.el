;; Configuration for LaTeX editing

(use-package auctex
  :ensure t
  :mode "\\.(la)?tex\\'"
  )

(use-package company-auctex
  :ensure t
  :init (company-auctex-init)
  :after (auctex company))


(use-package company-math
  :ensure t)

(use-package company-bibtex
  :ensure t
  :demand t)

(use-package company-reftex
  :ensure t
  :demand t)
