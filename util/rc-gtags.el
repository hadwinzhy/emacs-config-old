(provide 'rc-gtags)

;;;;;;;;;;;;;;;;;;;;;;;;GTAGS START;;;;;;;;;;;;;;;;;;;;;;;;
;; Download:http://www.gnu.org/software/global/download.html
;; Usage: ./configure; make; make install;
;; and move gtags.el form /usr/local/share/gtags to local
;;;;;;;;;;;;;;;;;;;;;;;;GTAGS END;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'gtags-mode "gtags" "" t);;start Emacs and execute gtags-mode function.  
(setq c-mode-hook
      '(lambda ()
     (gtags-mode 1)));get into gtags-mode whenever you get into c-mode

(defun ww-next-gtag ()
  "Find next matching tag, for GTAGS."
  (interactive)
  (let ((latest-gtags-buffer
         (car (delq nil  (mapcar (lambda (x) (and (string-match "GTAGS SELECT" (buffer-name x)) (buffer-name x)) )
                                 (buffer-list)) ))))
    (cond (latest-gtags-buffer
           (switch-to-buffer latest-gtags-buffer)
           (forward-line)
           (gtags-select-it nil))
          ) ))
;;Here’s my key binding for using GNU Global.
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))
(global-set-key "\M-;" 'ww-next-gtag)   ;; M-; cycles to next result, after doing M-. C-M-. or C-M-,
