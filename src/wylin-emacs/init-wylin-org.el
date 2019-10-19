(require-package 'org-bullets)
(require 'org-bullets)

(add-hook 'org-mode-hook
          (lambda () (org-bullets-mode 1)))

;; 忽略org执行代码时的确认
(setq org-confirm-babel-evaluate nil)

;; 使用xelatex编译org，并转成pdf
;;(setq org-latex-pdf-process (quote ("xelatex -interaction nonstopmode -output-directory %o %f")))

(provide 'init-wylin-org)
