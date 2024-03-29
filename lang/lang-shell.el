;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Shell;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'lang-shell)
;;change color of folder
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default default default italic underline bold bold-italic modeline])
 '(ansi-color-names-vector ["black" "red" "PaleGreen" "yellow" "DodgerBlue1" "magenta" "cyan" "white"])
 '(ecb-options-version "2.40")
; '(session-use-package t nil (session)
)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Bash AutoComplete Start;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for apt-get
;(require 'shell-completion)

(require 'bash-completion)
(autoload 'bash-completion-dynamic-complete 
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
  'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
  'bash-completion-dynamic-complete)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Bash AutoComplete End;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;for multi shell 
(defun my-shell-mode-auto-rename-buffer (text)
  (if (eq major-mode 'shell-mode)
      (rename-buffer  (concat "sh:" default-directory) t)))
(add-hook 'comint-output-filter-functions 'my-shell-mode-auto-rename-buffer)

;;clear-shell
(defun clear-shell ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max)))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(eval-after-load 'shell
  '(progn
;     (define-key shell-mode-map [up] 'comint-previous-input)
;     (define-key shell-mode-map [down] 'comint-next-input)
     (define-key shell-mode-map "\C-p" 'comint-previous-input)
     (define-key shell-mode-map "\C-n" 'comint-next-input)))
