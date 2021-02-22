;; Configuration of themes and other visual properties

;; Remove menu bar and scroll bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Set a  nicer modeline
(use-package smart-mode-line-powerline-theme
  :ensure t)

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'powerline)
  (add-hook 'after-init-hook 'sml/setup))

(use-package nlinum
  :config
  (global-nlinum-mode))

;; Disable the bell
(setq ring-bell-function 'ignore)

;; Highlight current line mode globally
(global-hl-line-mode 1)


;; Line number on the side
(use-package nlinum
  :ensure t
  :init
  (global-nlinum-mode t))

;; Theme: Set colors for font-lock mode,
(use-package nord-theme
  :ensure t
  :init(load-theme 'nord t))

;; Shows where the cursor jumps
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
