(provide 'lang-c)
(defun mychook()
(c-set-style "k&r"))
(add-hook 'c-mode-hook 'mychook)

(setq c-basic-offset 4)
