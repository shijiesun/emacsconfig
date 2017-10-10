;;; package -- summary

;;; init-package.el ssj's configuration entry point
;;

;;; Commentary:
;; this file is ssj's init-package configuration

;;; Code:

;; added by ssj

(add-to-list 'load-path "/home/ssj/.emacs.d/elpa/neotree-20170522.758/")
(global-set-key [f8] 'neotree-toggle)


(global-set-key (kbd "C-c q") 'bing-dict-brief)
(setq bing-dict-add-to-kill-ring t)
(setq bing-dict-show-thesaurus 'both)
(setq bing-dict-pronunciation-style 'uk)
(setq bing-dict-save-search-result t)
(setq bing-dict-org-file "/home/ssj/git/doc/vocabulary.org")


(defun bing-dict-detail()
  (interactive)
  (eww-browse-url
   (concat "http://www.bing.com/dict/search?mkt=zh-cn&q="
           (url-hexify-string
            (read-string "Query: "))))
  )


;;(setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;        ("http" . "127.0.0.1:8118")
;;        ("https" . "127.0.0.1:8118")))


;;(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "<f6>") 'ivy-resume)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;(Global-set-key (kbd "<f1> l") 'counsel-find-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;(global-set-key (kbd "C-c p f") 'counsel-git)
;;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;;(global-set-key (kbd "C-c k") 'counsel-ag)
;;(global-set-key (kbd "C-x l") 'counsel-locate)
;;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)


(provide 'init-package)
;;; init-package.el ends here
