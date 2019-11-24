(require-package 'fcitx)
(require 'fcitx)

(cond
 ;; macOS
 ((eq system-type 'darwin)
  (when (executable-find "fcitx-remote")
    (fcitx-aggressive-setup)))

 ;; Windows
 ((eq system-type 'window-nt)
  (if (executable-find "fcitx-remote")
      (fcitx-aggressive-setup)))

 ;; Linux
 ((eq system-type 'gnu/linux)
  (when (executable-find "fcitx-remote")
    (fcitx-aggressive-setup)
    (setq fcitx-use-dbus t)))
 )

(provide 'init-fcitx)
