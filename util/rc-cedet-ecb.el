;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CEDET START;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download: now i use the cedet inside the emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CEDET END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'rc-cedet-ecb)

(require 'cedet)

;;;;  Helper tools.

(custom-set-variables

 '(semantic-default-submodes (quote ( )))

 '(semantic-idle-scheduler-idle-time 3))

;; try to load EDE Project Mode
(global-ede-mode t)

(semantic-mode 1)

;;enables automatic bookmarking of tags that you edited, so you can return to them later with the semantic-mrub-switch-tags command;
(global-semantic-mru-bookmark-mode 1)

;;enables global support for Semanticdb;
(global-semanticdb-minor-mode 1)

;;activates highlighting of first line for current tag (function, class, etc.);
(global-semantic-highlight-func-mode 1)

(global-semantic-decoration-mode 1)

;;a minor mode for performing code completions during idle time. T
(global-semantic-idle-completions-mode 1)

;; Its primary job is to perform buffer parsing during idle time.
(global-semantic-idle-scheduler-mode 1)

;; displays a short summary of the symbol at point, such as its function prototype
(global-semantic-idle-summary-mode 1)

;;To enable more advanced functionality for name completion, etc., you can load the semantic/ia with following command:
(require 'semantic/ia)
(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))


;; inclue settings
(require 'semantic/bovine/gcc)
(require 'semantic/bovine/c)

(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public" "."
        "../.." "../../include" "../../inc" "../../common" "../../public"))

(setq cedet-sys-include-dirs
      (list
       "/usr/include"
       "/usr/include/x86_64-linux-gnu"
       "/usr/include/bits"
       "/usr/include/glib-2.0"
       "/usr/include/gnu"
       "/usr/include/gtk-2.0"
       "/usr/include/gtk-2.0/gdk-pixbuf"
       "/usr/include/gtk-2.0/gtk"
       "/usr/local/include"
       "/usr/local/include"))


(let
  ((include-dirs cedet-user-include-dirs))
  (setq include-dirs (append include-dirs cedet-sys-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

(setq semantic-c-dependency-system-include-path "/usr/include/")


;;;; TAGS Menu

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))

(add-hook 'semantic-init-hooks 'my-semantic-hook)


;;;; Semantic DataBase postion
(setq semanticdb-default-save-directory
      (expand-file-name "~/.emacs.d/semanticdb"))


;; 使用 gnu global 的TAGS。

(require 'semantic/db-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)


;;;;  缩进或者补齐

;;; hippie-try-expand settings
(setq hippie-expand-try-functions-list
      '(
        yas/hippie-try-expand
        semantic-ia-complete-symbol

        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill

        try-complete-file-name-partially
        try-complete-file-name

        try-expand-all-abbrevs))


; C-mode-hooks .

(defun yyc/c-mode-keys ()
  "description"
  ;; Semantic functions.
  (semantic-default-c-setup)
;  (local-set-key "/C-c?" 'semantic-ia-complete-symbol-menu)
;  (local-set-key "/C-cb" 'semantic-mrub-switch-tags)
;  (local-set-key "/C-cR" 'semantic-symref)
;  (local-set-key "/C-cj" 'semantic-ia-fast-jump)
;  (local-set-key "/C-cp" 'semantic-ia-show-summary)
;  (local-set-key "/C-cl" 'semantic-ia-show-doc)
;  (local-set-key "/C-cr" 'semantic-symref-symbol)
;  (local-set-key "/C-c/" 'semantic-ia-complete-symbol)
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)

  ;; Indent or complete

  (local-set-key  [(tab)] 'indent-or-complete)

  )

(add-hook 'c-mode-common-hook 'yyc/c-mode-keys)


(defun indent-or-complete ()
  "Complete if point is at end of a word, otherwise indent line."
  (interactive)
  (if (looking-at "//>")
      (hippie-expand nil)
    (indent-for-tab-command)))



(defun yyc/indent-key-setup ()
  "Set tab as key for indent-or-complete"
  (local-set-key  [(tab)] 'indent-or-complete))


;; try to fix bug
;;"Symbol's function definition is void: semantic-analyze-tag-references"
(require 'semantic/analyze/refs)


;; jump and back jump
(defun semantic-ia-fast-jump-or-back (&optional back)
  (interactive "P")
  (if back
      (semantic-ia-fast-jump-back)
    (semantic-ia-fast-jump (point))))

(global-set-key [f12] 'semantic-ia-fast-jump-or-back)
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                 (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ECB START;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download:http://ecb.sourceforge.net/cvs_snapshots/ecb.tar.gz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ECB END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq stack-trace-on-error t) ;; to fix bug which can't open

(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-version-check nil)
(setq ecb-tip-of-the-day nil) ; 不显示每日提醒
(setq inhibit-startup-message t)

(global-set-key [f8] 'ecb-activate) ;; 定义 F8 键为激活 ecb
