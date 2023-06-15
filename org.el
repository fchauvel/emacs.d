(defvar fchauvel/notes-library "~/notes")

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (C . t)
   (dot . t)
   (R . t)
   (ruby . t)
   (shell . t)
   (screen . t)
   (scheme . t)
   (js . t)
   (java . t)
   (ditaa . t)
   (restclient . t)))

(setq org-babel-R-command "/Library/Frameworks/R.framework/Resources/R --slave --no-save")

(setq org-ditaa-jar-path "/opt/homebrew/Cellar/ditaa/0.11.0_1/libexec/ditaa.jar")

(setq bibtex-completion-bibliography (list fchauvel/bibtex-library)
      bibtex-completion-library-path (list fchauvel/pdf-library)
      bibtex-completion-notes-path fchauvel/notes-library)

(use-package helm-bibtex
  :after (helm))

(use-package org-ref
  :after (helm-bibtex)
  :config
  (progn
    (require 'bibtex)
    (require 'org-ref-helm)))

(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory fchauvel/notes-library)
  (org-roam-db-location (concat fchauvel/notes-library "/org-roam.db"))
  (org-roam-index-file (concat fchauvel/notes-library "/index.org"))
  (org-roam-db-update-method 'immediate)
  :bind (("C-c n l" . org-roam)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-insert)
         ("C-c n I" . org-roam-insert-immediate))
  :config
  (org-roam-setup))
