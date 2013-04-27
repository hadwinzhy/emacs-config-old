(provide 'lang-orgmode)

(require 'org-install)

(setq load-path (cons "/local/code/github/emacs-config/3rd-party/org-mode/lisp" load-path))

 (setq org-agenda-files (list "/local/data/org-mode/newgtd.org"
                            "/local/data/org-mode/journal.org"
                             "/local/data/org-mode/birthday.org"))

(setq org-todo-keywords
    '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d@/!)"  "CANCELED(c@/!)" )
     ))    

(defun org-summary-todo (n-done n-not-done)
      "Switch entry to DONE when all subentries are done, to TODO otherwise."
      (let (org-log-done org-log-states)   ; turn off logging
        (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
    
    (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
