;;; package -- summary

;;; init-ui.el ssj's configuration entry point
;;

;;; Commentary:
;; this file is ssj's init-ui configuration

;;; Code:

;; added by ssj


(global-linum-mode t)

(setq-default cursor-type 'bar)


(add-to-list 'default-frame-alist '(fullscreen . maximized))
;;(setq initial-frame-alist (quote((fullscreen, maximized))))

(provide 'init-ui)
;;; init-ui.el ends here
