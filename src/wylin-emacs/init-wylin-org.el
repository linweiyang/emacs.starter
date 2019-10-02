(require-package 'org-bullets)
(require 'org-bullets)

(add-hook 'org-mode-hook
          (lambda () (org-bullets-mode 1)))

;; 使用xelatex编译org，并转成pdf
;;(setq org-latex-pdf-process (quote ("xelatex -interaction nonstopmode -output-directory %o %f")))
(custom-set-variables '(setq org-latex-pdf-process (quote ("xelatex -interaction nonstopmode -output-directory %o %f"))))

(provide 'init-wylin-org)
