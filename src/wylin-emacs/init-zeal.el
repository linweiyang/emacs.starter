(defun sanityinc/zeal-installed-p ()
  "Return t if Zeal is installed on this machine, or nil otherwise."
  (file-executable-p "zeal"))

(when (and (not *is-a-mac*) (not (package-installed-p 'zeal-at-point)))
  (message "Checking whether Zeal is installed")
  (when (sanityinc/zeal-installed-p)
    (require-package 'zeal-at-point)))

(when (package-installed-p 'zeal-at-point)
  (global-set-key (kbd "C-c D") 'zeal-at-point))

(provide 'init-zeal)
