;; difference personal configuration with purcell's emacs configuration
(require-package 'undo-tree)
(global-undo-tree-mode)
(defadvice undo-tree-visualizer-mode (after undo-tree-face activate)
  (buffer-face-mode))

;; disable display-line-numbers-mode
(remove-hook 'prog-mode-hook 'display-line-numbers-mode)

;; remove beacon-mode which makes the emacs slower
(remove-hook 'after-init-hook 'beacon-mode)

(provide 'init-personal)
