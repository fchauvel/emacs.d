;; Installation of R

(setenv "PATH"
        (concat
         "/Library/Frameworks/R.framework/Resources" ":"
         (getenv "PATH")
         ))

(setq inferior-ess-r-program-name "/Library/Frameworks/R.framework/Resources/bin/R")
