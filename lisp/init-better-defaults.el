;;; package -- summary

;;; init-better-defaults.el ssj's configuration entry point
;;

;;; Commentary:
;; this file is ssj's init-better-defaults configuration

;;; Code:

;; added by ssj

(setq prelude-theme 'monokai)

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


(provide 'init-better-defaults)
;;; init-better-defaults.el ends here
