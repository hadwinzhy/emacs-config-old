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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Í¨ÓÃÉèÖÃ;;;;;;;;;;;;;;;;;;;;;;;;
(prefer-coding-system 'utf-8)

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
;;;; ¸÷´°¿Ú¼äÇÐ»»
(global-set-key [C-left] 'windmove-left)
(global-set-key [C-right] 'windmove-right)
(global-set-key [C-up] 'windmove-up)
(global-set-key [C-down] 'windmove-down)
(defun increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                       nil
                       :height
                       (ceiling (* 1.10
                                   (face-attribute 'default :height)))))
(defun decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                       nil
                       :height
                       (floor (* 0.9
                                 (face-attribute 'default :height)))))
(global-set-key (kbd "C-=") 'increase-font-size)
(global-set-key (kbd "C--")  'decrease-font-size)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;other;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq default-fill-column 80)
;;ÉèÖÃÈ±Ê¡Ä£Ê½ÊÇtext£¬¶ø²»ÊÇ»ù±¾Ä£Ê½
(setq default-major-mode 'text-mode)
(global-font-lock-mode t);Óï·¨¸ßÁÁ
(auto-image-file-mode t);´ò¿ªÍ¼Æ¬ÏÔÊ¾¹¦ÄÜ
(fset 'yes-or-no-p 'y-or-n-p);ÒÔ y/n´ú±í yes/no£¬¿ÉÄÜÄã¾õµÃ²»ÐèÒª£¬ºÇºÇ¡£
(setq mouse-yank-at-point t);Ö§³ÖÖÐ¼üÕ³Ìù
(setq x-select-enable-clipboard t);Ö§³ÖemacsºÍÍâ²¿³ÌÐòµÄÕ³Ìù
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
