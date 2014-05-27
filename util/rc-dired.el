(require 'dired-x) ; dired开启omit模式. 可以通过dired-omit-files, 指定pattern来隐藏文件.
(set-default 'dired-omit-mode 1) ; 全局开启omit模式.
;; 全局设定一个快捷键, 在任何时候, 一键切入当前buffer所在的目录. 我使用了Control-f
(global-set-key [(control f)] '(lambda () (interactive) (dired ".")))
(provide 'rc-dired)
