(require-package 'fcitx)
(require 'fcitx)

(cond
 ;; macOS
 ((eq system-type 'darwin)
  (if (file-executable-p "fcitx-remote")
      (fcitx-aggressive-setup))
  )

 ;; ;; Windows
 ;; ((eq system-type 'window-nt)
 ;;  (if (file-executable-p "fcitx-remote")
 ;;      (fcitx-aggressive-setup))
 ;;  )

 ;; Linux
 ((eq system-type 'gnu/linux)
  (if (file-executable-p "fcitx-remote")
      ((fcitx-aggressive-setup)
       (setq fcitx-use-dbus t)))
  )
 )

(provide 'init-fcitx)
