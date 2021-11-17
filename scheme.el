;; Configuration for Scheme/Racket

(setq exec-path (append exec-path '("/Applications/Racket v8.1/bin")))


(use-package geiser
  :ensure t
  :defer t
  :custom (setq geiser-active-implementations '(racket)))

(use-package geiser-racket
  :ensure t
  :defer t)
