(provide 'rc-autocomplete)

;;;;;;;;;;;;;;;;;;;;;;;;;Yasnippet Start;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download https://github.com/capitaomorte/yasnippet.git
;;Usage: 
;;;;;;;;;;;;;;;;;;;;;;;;;Yasnippet End;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet) ;; not yasnippet-bundle
(yas/global-mode 1)
;; default TAB key is occupied by auto-complete
(global-set-key (kbd "C-c ; u") 'yas/expand)
;; default hotkey `C-c & C-s` is still valid
(global-set-key (kbd "C-c ; s") 'yas/insert-snippet)
;; give yas/dropdown-prompt in yas/prompt-functions a chance
(require 'dropdown-list)
;; use yas/completing-prompt when ONLY when `M-x yas/insert-snippet'
;; thanks to capitaomorte for providing the trick.
(defadvice yas/insert-snippet (around use-completing-prompt activate)
     "Use `yas/completing-prompt' for `yas/prompt-functions' but only here..."
       (let ((yas/prompt-functions '(yas/completing-prompt)))
             ad-do-it))

;;;;;;;;;;;;;;;;;;;;;;;;AutoComplete;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/local/github/emacs-config/3rd-party/auto-complete/dict")
(ac-config-default)
(global-auto-complete-mode t)

(setq-default ac-sources '(ac-source-yasnippet 
                           ac-source-semantic  
                           ac-source-ropemacs  
                           ac-source-imenu    
                           ac-source-words-in-buffer  
                           ac-source-dictionary  
                           ac-source-abbrev    
                           ac-source-words-in-buffer    
                           ac-source-files-in-current-dir    
                           ac-source-filename))   
(add-hook 'emacs-lisp-mode-hook    (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))  
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))  


(add-hook 'python-mode-hook        (lambda () (add-to-list 'ac-omni-completion-sources (cons "\\." '(ac-source-ropemacs)))  ))    

(setq ac-auto-start 2)
(setq ac-dwim t)
;; trigger using TAB and disable auto start
;(custom-set-variables
; '(ac-trigger-key "TAB")
; '(ac-auto-start nil)
; '(ac-use-menu-map t))

;; set complete by tab 
;(define-key ac-completing-map "\t" 'ac-complete)
;(define-key ac-completing-map "\r" nil)


;; ignore "//"
;(add-hook 'c-mode-hook
;          (lambda ()
;            (make-local-variable 'ac-ignores)
;            (add-to-list 'ac-ignores "/")
;	    (add-to-list 'ac-ignores "//")))

;(setq ac-modes (append ac-modes '(objc-mode)))



;; Compilation
;(setq compilation-scroll-output t)

