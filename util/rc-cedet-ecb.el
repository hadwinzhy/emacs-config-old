;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CEDET START;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download: now i use the cedet inside the emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CEDET END;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'rc-cedet-ecb)
;(require 'cedet-devel-load)
(require 'cedet)
(semantic-mode 1)

;; try to load EDE Project Mode
;(global-ede-mode t)

;;enables automatic bookmarking of tags that you edited, so you can return to them later with the semantic-mrub-switch-tags command;
(global-semantic-mru-bookmark-mode 1)

;;enables global support for Semanticdb;
(global-semanticdb-minor-mode 1)   

;;activates highlighting of first line for current tag (function, class, etc.);
(global-semantic-highlight-func-mode 1)

;;To enable more advanced functionality for name completion, etc., you can load the semantic/ia with following command:
(require 'semantic/ia)


;;;; Include settings
;(require 'semantic/bovine/gcc)
;(require 'semantic/bovine/c)

;; try to fix bug 
;;"Symbol's function definition is void: semantic-analyze-tag-references"
(require 'semantic/analyze/refs)

;; jump and back jump
(global-set-key [f12] 'semantic-ia-fast-jump)
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

(setq ecb-tip-of-the-day nil) ; 不显示每日提醒
(setq inhibit-startup-message t)

;;;; 各窗口间切换 
(global-set-key [C-left] 'windmove-left)
(global-set-key [C-right] 'windmove-right)
(global-set-key [C-up] 'windmove-up)
(global-set-key [C-down] 'windmove-down)

(global-set-key [f8] 'ecb-activate) ;; 定义 F8 键为激活 ecb
