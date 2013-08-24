(provide 'rc-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Font Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download: sudo apt-get install fonts-inconsolata
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Font End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-default-font "-unknown-Inconsolata-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(load "color-theme-molokai.el")
(color-theme-molokai)
;(load-theme 'solarized-dark t)
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


;启动最大化
(defun my-maximized-horz ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(defun my-maximized-vert ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(defun my-maximized ()
 (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
 (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(my-maximized)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;UI Config End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
