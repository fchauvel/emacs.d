;; Set up gitbash as the default shell in Emacs on Windows
(setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
(setq shell-file-name "bash")
(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(add-to-list 'exec-path "C:/Program Files/Git/bin")
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; Downloaded Hunspell (win32) from
;; https://sourceforge.net/projects/ezwinports/ and unzipped it into
;; C:\Hunspell
(setq-default ispell-program-name
              (executable-find "hunspell"))
(setq ispell-dictionary "en_GB")

(prefer-coding-system 'utf-8)
