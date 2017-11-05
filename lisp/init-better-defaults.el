;;; package -- summary

;;; init-better-defaults.el ssj's configuration entry point
;;

;;; Commentary:
;; this file is ssj's init-better-defaults configuration

;;; Code:

;; added by ssj

;;(setq prelude-theme 'monokai)

(setq make-backup-files nil)

(setq mark-holidays-in-calendar t)

(setq my-holidays
      '(;;公历节日
        (holiday-fixed 2 14 "情人节")
        (holiday-fixed 9 10 "教师节")
        (holiday-float 6 0 3 "父亲节")
        ;; 农历节日
        (holiday-lunar 1 1 "春节")
        (holiday-lunar 1 15 "元宵节")
        (holiday-solar-term "清明" "清明节")
        (holiday-lunar 5 5 "端午节")
        (holiday-lunar 7 7 "七夕情人节")
        (holiday-lunar 8 15 "中秋节")
        ;;纪念日
        (holiday-fixed 1 11 "孙正阳生日")
        (holiday-lunar 6 3 "老婆生日")
        (holiday-lunar 3 29 "我的生日")
        (holiday-fixed 5 23 "孙正昊生日")
        (holiday-lunar 8 23 "爸爸生日")
        (holiday-lunar 6 8 "妈妈生日")
        (holiday-fixed 9 20  "Wedding Anniversary")
        ))
(setq calendar-holidays my-holidays) ;只显示我定制的节假日

(defun auto-sequence (format start end)
  (interactive "sSequence format is? \nnEnter start number: \nnEnter end number:")
  (progn
    (kmacro-set-format format)
    (kmacro-set-counter start)
    (while (< start (+ 1 end))
      (execute-kbd-macro (read-kbd-macro "<f3> RET"))
      (setq start (+ 1 start)))
    ))

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

(setq global-auto-revert-mode 1)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.g4\\'" . antlr-mode))
       auto-mode-alist))

(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ("homeaddr" "湖南尚长沙市望城区金星北路399号南山苏迪亚诺2栋")
                                            ("compaddr" "湖南省长沙市岳麓区鲁谷大道658号麓谷信息港A座11楼11/1办公室")
                                            ))
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key (kbd "C-c w") 'copy-line)

(setq ;; foreground and background
 monokai-foreground     "#ABB2BF"
 monokai-background     "#282C34"
 ;; highlights and comments
 monokai-comments       "#F8F8F0"
 monokai-emphasis       "#282C34"
;; monokai-highlight      "#FFB269"
 monokai-highlight      "#338FFF"
 monokai-highlight-alt  "#66D9EF"
;; monokai-highlight-line "#1B1D1E"
 monokai-highlight-line "#3E4451"
 monokai-line-number    "#F8F8F0"
 ;; colours
 monokai-blue           "#61AFEF"
 monokai-cyan           "#56B6C2"
 monokai-green          "#98C379"
 monokai-gray           "#3E4451"
 monokai-violet         "#C678DD"
 monokai-red            "#E06C75"
 monokai-orange         "#D19A66"
 monokai-yellow         "#E5C07B")

(setq monokai-height-minus-1 0.8
      monokai-height-plus-1 1.1
      monokai-height-plus-2 1.15
      monokai-height-plus-3 1.2
      monokai-height-plus-4 1.3)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(global-set-key (kbd "M-n") (lambda () (interactive) (scroll-up   4)) )
(global-set-key (kbd "M-p") (lambda () (interactive) (scroll-down 4)) )

(global-set-key (kbd "C-w") 'backward-kill-word)

(provide 'init-better-defaults)
;;; init-better-defaults.el ends here
