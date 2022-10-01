;; Configuration for Typescript

;; Typescript
(use-package typescript-mode
 :ensure t
 :defer t
 :mode ("\\.tsx?\\'" . typescript-mode)
 :hook (typescript-mode-hook .
                             (lambda ()
                               (make-local-variable 'indent-tabs-mode)
                               (setq indent-tabs-mode nil)
                               (whitespace-mode))))
