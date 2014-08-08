;;;;;;;;;;;;;;;;;;;;;;;;;;Tabbar Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download:http://www.emacswiki.org/emacs/tabbar.el
;;Usage: http://emacswiki.org/emacs/TabBarMode
;;;;;;;;;;;;;;;;;;;;;;;;;;Tabbar End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "<M-up>")    'tabbar-backward-group)
(global-set-key (kbd "<M-down>")  'tabbar-forward-group)
(global-set-key (kbd "<M-left>")  'tabbar-backward-tab)
(global-set-key (kbd "<M-right>") 'tabbar-forward-tab)

(setq
  tabbar-scroll-left-help-function nil   ;don't show help information
  tabbar-scroll-right-help-function nil
  tabbar-help-on-tab-function nil
  tabbar-home-help-function nil
  tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
  tabbar-scroll-left-button (quote (("") ""))
  tabbar-scroll-right-button (quote (("") ""))
)

;sort buffers by file-name, so the same function files will be together
 (defun tabbar-add-tab (tabset object &optional append_ignored)
  "Add to TABSET a tab with value OBJECT if there isn't one there yet.
 If the tab is added, it is added at the beginning of the tab list,
 unless the optional argument APPEND is non-nil, in which case it is
 added at the end."
  (let ((tabs (tabbar-tabs tabset)))
    (if (tabbar-get-tab object tabset)
        tabs
      (let ((tab (tabbar-make-tab object tabset)))
        (tabbar-set-template tabset nil)
        (set tabset (sort (cons tab tabs)
          (lambda (a b) (string< (buffer-file-name (car a)) (buffer-file-name (car b))))))))))

;;;;;;;;;;;;;;;;;;;;;Tab Group devide;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;group 1: shell or other process
;;group 2: emacs buffer, like "Message"
;;group 3: the file which I opened it
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
  (list
  (cond
    ((or (get-buffer-process (current-buffer))
         ;; Check if the major mode derives from `comint-mode' or
         ;; `compilation-mode'.
         (tabbar-buffer-mode-derived-p
          major-mode '(comint-mode compilation-mode)))
     "Process"
     )
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    (t
     "User Buffer"
     ))))

(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

(provide 'rc-tabbar)
