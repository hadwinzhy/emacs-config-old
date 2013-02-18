(provide 'rc-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Font Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download: sudo apt-get install fonts-inconsolata
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Font End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-default-font "-unknown-Inconsolata-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Color Theme Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download: http://download.savannah.gnu.org/releases/color-theme/color-theme.el.gz
;;Local: /root/3rd-party/color-theme/color-theme.el
;;Railscasts.el:
;;Download: https://github.com/olegshaldybin/color-theme-railscasts.git
;;Local: /root/3rd-party/color-theme/color-theme-railscasts.git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Color Theme End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'color-theme)
(setq custom-theme-load-path  (cons (concat basePath "/3rd-party/color-theme/") custom-theme-load-path))
(load-theme 'solarized-dark t)
;(load "color-theme-railscasts.el")
;(eval-after-load "color-theme"
;  '(progn
;     (color-theme-railscasts)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;UI Config Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)  ; 取消开机画面

(setq frame-title-format '("Emacs@" system-name ": %b %+%+ %f"))

(setq column-number-mode t);显示列号
(global-linum-mode 1)
(show-paren-mode t);显示括号匹配 防止光标来回跳
(setq show-paren-style 'parentheses)

(display-time-mode 1);显示时间，格式如下
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

(tool-bar-mode -1);去掉工具栏
(menu-bar-mode nil);

(scroll-bar-mode nil);去掉滚动条，因为可以使用鼠标滚轮了 ^_^
(mouse-avoidance-mode 'animate);光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线


;;removed for windows
;启动最大化
;(defun my-maximized-horz ()
;  (interactive)
;  (x-send-client-message
;   nil 0 nil "_NET_WM_STATE" 32
;   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
;(defun my-maximized-vert ()
;  (interactive)
;  (x-send-client-message
;   nil 0 nil "_NET_WM_STATE" 32
;   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
;(defun my-maximized ()
; (interactive)
;  (x-send-client-message
;   nil 0 nil "_NET_WM_STATE" 32
;   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
; (interactive)
;  (x-send-client-message
;   nil 0 nil "_NET_WM_STATE" 32
;  '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
;(my-maximized)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;UI Config End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
