;; Note taking using org-roam

(use-package org-ref
  :ensure t
  :config
  (setq reftex-default-bibliography "~/notes/references.bib"
        org-ref-bibliography-notes "~/notes/references.org"
        org-ref-default-bibliography '("~/notes/references.bib")
        org-ref-pdf-directory "~/notes/pdf/"))

(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/notes")
      (org-roam-db-location "~/notes/org-roam.db")
      (org-roam-index-file "~/notes/index.org")
      (org-roam-db-update-method 'immediate)
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))
