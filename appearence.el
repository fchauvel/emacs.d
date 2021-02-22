;; Configuration of themes and other visual properties

;; Disable the bell
(setq ring-bell-function 'ignore)

;; Highlight current line mode globally
(global-hl-line-mode 1)

;; Theme: Set colors for font-lock mode,


(use-package kaolin-themes
  :ensure t
  :init(load-theme 'kaolin-breeze t))

(use-package beacon
  :config
  (beacon-mode t)
  )

;; Rainbow delimiters: Color the delimiters according to their depth
(use-package rainbow-delimiters
  :ensure t
  :init
  :hook (prog-mode . rainbow-mode))

(use-package rainbow-mode
  :ensure t
  :init
  :hook (prog-mode . rainbow-mode))

;; Indent guide: Show markers in front of the current scope
(use-package indent-guide
  :ensure t
  :init
  (progn
    (indent-guide-global-mode)
    (setq indent-guide-recursive t)))
