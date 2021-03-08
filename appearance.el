;; Configuration of themes and other visual properties

;; Remove menu bar and scroll bars
(menu-bar-mode -1)
(require 'scroll-bar)
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

;; Line numbers on the side
(use-package nlinum
  :ensure t
  :init
  (global-nlinum-mode))

;; Disable the bell
(setq ring-bell-function 'ignore)

;; Highlight current line mode globally
(global-hl-line-mode 1)


;; Theme: Set colours for font-lock mode,
(use-package nord-theme
  :ensure t
  :init (progn
          (setq nord-comment-brightness 15)
          (load-theme 'nord t)))

;; Shows where the cursor jumps
(use-package beacon
  :ensure t
  :config
  (beacon-mode t))

;; Rainbow delimiters: Color the delimiters according to their depth
(use-package rainbow-delimiters
  :ensure t
  :hook ((prog-mode . rainbow-delimiters-mode)))

;; Colour codes (e.g. #ff0077) are displayed with the appropriate colour
(use-package rainbow-mode
  :ensure t
  :hook ((prog-mode . rainbow-mode)))

;; Indent guide: Show markers in front of the current scope
(use-package indent-guide
  :ensure t
  :init
  (progn
    (indent-guide-global-mode)
    (setq indent-guide-recursive t)))
