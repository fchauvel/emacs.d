(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-mirror" . "https://www.mirrorservice.org/sites/melpa.org/packages/") t)

(package-initialize)

(require 'tex-mode)
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'latex-mode-hook 'flyspell-buffer)


;; Configuration for the Markdown mode

;; Activte whitespace-mode with space for Markdown files
(add-hook 'markdown-mode-hook
	  (lambda ()
	    (make-local-variable 'indent-tabs-mode)
	    (setq indent-tabs-mode nil)
	    (whitespace-mode)))

;; Clean-up white space when saving MArkdown files
(add-hook 'before-save-hook
	  (lambda ()
	    (when (eq 'markdown-mode major-mode)
	      (whitespace-cleanup))))

;; 
;; Configuration for the Typescript mode

;; Activte whitespace-mode with space for Typescript files
(add-hook 'typescript-mode-hook
	  (lambda ()
	    (make-local-variable 'indent-tabs-mode)
	    (setq indent-tabs-mode nil)
	    (whitespace-mode)))


;; Clean-up white space when saving Typescript files
(add-hook 'before-save-hook
	  (lambda ()
	    (when (eq 'typescript-mode major-mode)
	      (whitespace-cleanup))))


;; Activate hl mode globally
(global-hl-line-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-delimiters indent-guide yaml-mode typescript-mode markdown-mode magit dockerfile-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
