(require-package 'org-bullets)
(require 'org-bullets)

(add-hook 'org-mode-hook
          (lambda () (org-bullets-mode 1)))

;; 忽略org执行代码时的确认
(setq org-confirm-babel-evaluate nil)

;; org-mode
(add-hook
 'org-mode-hook
 (lambda ()
   (define-key org-mode-map (kbd "C-c C-p")
     'org-beamer-export-to-pdf)
   (define-key org-mode-map (kbd "C-c C-l")
     'org-beamer-export-to-latex)
   (define-key org-mode-map (kbd "C-c C-c")
     'org-beamer-export-to-pdf-wylin)
   (define-key org-mode-map (kbd "￥")
     "$")
   (define-key org-mode-map (kbd "【")
     "[")
   (define-key org-mode-map (kbd "】")
     "]")
   (define-key org-mode-map (kbd "「")
     "{")
   (define-key org-mode-map (kbd "」")
     "}")
   ))

(defun org-beamer-export-to-pdf-wylin
    (&optional async subtreep visible-only body-only ext-plist)
  (interactive)
  (let ((file (org-export-output-file-name ".tex" subtreep)))
    (org-export-to-file 'beamer file
      async subtreep visible-only body-only ext-plist
      'recompile)))


;; 使用xelatex一步生成PDF，不是org-latex-to-pdf-process这个命令
(setq org-latex-pdf-process
      '(
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        ;;  "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        ;;  "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        ;;  "rm -fr %b.out %b.log %b.tex auto"
        ))

;; 设置默认后端为 `xelatex'
(setq org-latex-compiler "xelatex")

(provide 'init-wylin-org)
