
(provide 'rc-common)

;;;;;;;;;;;;;;;;;;;;;;;;;;;Highlight Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download http://nschum.de/src/emacs/highlight-symbol/
;;Usage: Use C-f3 to toggle highlighting of the symbol at point throughout the current buffer. 
;;Use highlight-symbol-mode to keep the symbol at point always highlighted.
;;;;;;;;;;;;;;;;;;;;;;;;;;;Highlight End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'highlight-symbol)

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
;; search in whole project
;(require 'find-file-in-project)
;(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;通用设置;;;;;;;;;;;;;;;;;;;;;;;;
(prefer-coding-system 'utf-8)
;(setq file-name-coding-system 'gbk)
;(set-terminal-coding-system 'gbk)
;(set-keyboard-coding-system 'gbk)
;(setq locale-coding-system 'gbk)
;(set-selection-coding-system 'gbk)
;(set-clipboard-coding-system 'ctext)
;(set-clipboard-coding-system 'gbk)
;(set-terminal-coding-system 'gbk)
;(set-buffer-file-coding-system 'gbk)
;(modify-coding-system-alist 'process "." 'gbk)
;(setq default-process-coding-system '(gbk . gbk))

;(set-language-environment 'utf-8)
;(set-keyboard-coding-system 'utf-8)   ; input
;(set-selection-coding-system 'utf-8)  ; copy/paste
;(set-language-environment 'Chinese-GB) 
;(set-keyboard-coding-system 'euc-cn) 
;(set-clipboard-coding-system 'euc-cn) 
;(set-clipboard-coding-system 'cn-gb-2312) 
;(set-terminal-coding-system 'euc-cn) 
;(set-buffer-file-coding-system 'euc-cn) 
;(set-selection-coding-system 'euc-cn) 
;(set-selection-coding-system 'cn-gb-2312) 
;(set-default-coding-systems 'euc-cn) 
;(setq locale-coding-system 'euc-cn) 
;(modify-coding-system-alist 'process "*" 'euc-cn) 
;(setq default-process-coding-system 
;'(euc-cn . euc-cn)) 
;(setq-default pathname-coding-system 'euc-cn)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;backup theory;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq make-backup-files nil)
(setq auto-save-default nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;mouse smooth scroll;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
 (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;key;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\C-l" 'goto-line)
;; use f5 to delete other windows, simpler than C-x 1 
(global-set-key [f5] 'delete-other-windows)

(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq tab-width 4)
(setq default-tab-width 4)
(setq c-basic-offset 4)
(setq tab-stop-list ())
;;;; 各窗口间切换 
(global-set-key [C-left] 'windmove-left)
(global-set-key [C-right] 'windmove-right)
(global-set-key [C-up] 'windmove-up)
(global-set-key [C-down] 'windmove-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;other;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq default-fill-column 80)
;;设置缺省模式是text，而不是基本模式
(setq default-major-mode 'text-mode)
(global-font-lock-mode t);语法高亮
(auto-image-file-mode t);打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p);以 y/n代表 yes/no，可能你觉得不需要，呵呵。
(setq mouse-yank-at-point t);支持中键粘贴
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴

