;; Configuration to use git


;; Required by magit to use the SSH agent on Windows
(use-package ssh-agency
  :ensure t
  :config
  (unless (file-exists-p "~/.ssh/id_rsa.pub")
    (remove-hook 'magit-credential-hook 'ssh-agency-ensure))
  (setenv "SSH_ASKPASS" "git-gui--askpass"))


;; Magit
(use-package magit
  :ensure t)
