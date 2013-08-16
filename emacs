(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ansi-color-for-comint-mode-on)
(fset 'yes-or-no-p 'y-or-n-p)
(auto-compression-mode 1)
(set 'column-number-mode t)

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

;;;calls clean-buffer-list, which see 
(require 'midnight)
(midnight-delay-set 'midnight-delay "4:30am")

(autoload 'd-mode "d-mode" "Major mode for editing D code." t)
(add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode))

(add-to-list 'load-path "/usr/share/emacs/site-lisp/" t)
(require 'go-mode-load)
(add-hook 'before-save-hook #'gofmt-before-save)

(defun go-if-error ()
  "Insert error checking boilerplate for go code."
  (interactive)
  (insert "\n")
  (indent-according-to-mode)
  (insert "if err != nil {\n\n}\n")
  (dotimes (i 2)
    (previous-line)
    (indent-according-to-mode)))


(defun go-compound-if-error ()
  "Insert error checking boilerplate for compound if in go code."
  (interactive)
  (insert "\n")
  (indent-according-to-mode)
  (insert "if , err := ; err != nil {\n\n}\n")
  (dotimes (i 2)
    (previous-line)
    (indent-according-to-mode))
  (previous-line)
  (beginning-of-line)
  (indent-according-to-mode)
  (dotimes (i 3) (forward-char)))

(add-hook
 'go-mode-hook
 '(lambda ()
    (local-set-key "\M-e" 'go-if-error)
    (local-set-key "\M-E" 'go-compound-if-error)
    (set (make-local-variable 'compile-command) "go test")
    (setq tab-width 4)
    (setq show-trailing-whitespace t)))

(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(require 'inf-haskell)
(require 'haskell-indent)

;;;all this compile stuff from the haskell wiki
(require 'compile)

;; this means hitting the compile button always saves the buffer
;; having to separately hit C-x C-s is a waste of time
(setq mode-compile-always-save-buffer-p t)
;; make the compile window stick at 12 lines tall
(setq compilation-window-height 12)

;; from enberg on #emacs
;; if the compilation has a zero exit code,
;; the windows disappears after two seconds
;; otherwise it stays
(setq compilation-finish-function
      (lambda (buf str)
        (unless (string-match "exited abnormally" str)
          ;;no errors, make the compilation window go away in a few seconds
	  (other-window 1)
          (run-at-time
           "2 sec" nil 'kill-buffer-and-window)
          (message "No Compilation Errors!"))))


;; one-button testing, tada!
(global-set-key [f12] 'compile)




(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
