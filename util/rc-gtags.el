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


