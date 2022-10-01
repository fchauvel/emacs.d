(setq-default indent-tabs-mode nil)
(setq-default column-number-mode t)

(use-package nlinum
  :hook ((prog-mode . nlinum-mode)))

(require 'whitespace)
(add-hook 'prog-mode-hook
          (lambda ()
            (whitespace-mode)
            ))

(add-hook 'before-save-hook
          (lambda ()
            (unless indent-tabs-mode
              (untabify (point-min) (point-max)))
            (when (derived-mode-p 'prog-mode)
              (whitespace-cleanup))))

(use-package rainbow-delimiters
  :hook ((prog-mode . rainbow-delimiters-mode)))

(use-package rainbow-mode
  :hook ((prog-mode . rainbow-mode)))

(use-package indent-guide
  :init
  (progn
    (indent-guide-global-mode)
    (setq indent-guide-recursive t)))

(use-package flycheck)

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq lsp-completion-provider :capf))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  :hook (
         (java-mode . #'lsp-deferred)
         (lsp-mode . lsp-lens-mode))
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (
         (lsp-mode . lsp-ui-mode)))

(use-package helm-lsp
  :after (treemacs lsp-treemacs)
  :commands helm-lsp-workspace-symbol)

(use-package all-the-icons)

(use-package treemacs
  :after (lsp-mode)
  :commands (treemacs)
  :hook (
         (treemacs-mode . (lambda () (linum-mode -1))))
  :config
  (progn
    (with-eval-after-load 'ace-window
      (setq aw-ignored-buffers (delq 'treemacs-mode aw-ignored-buffers)))
    (setq treemacs-no-png-images t
          treemacs-indent-guide-style 'line)
    (linum-mode -1)
    ;; (treemacs-indent-guide-mode)
    )
  )

(use-package treemacs-magit
  :after (treemacs magit))

;; Could not get this to work
;; (use-package treemacs-all-the-icons
;;   :after (treemacs)
;;   :config
;;   (treemacs-load-theme "all-the-icons") 
;;   );

(use-package lsp-treemacs
  :after (lsp-mode treemacs)
  :commands lsp-treemacs-errors-list)
