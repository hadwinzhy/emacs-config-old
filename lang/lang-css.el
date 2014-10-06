;sass
(require 'sass-mode)

;scss
(require 'scss-mode)
(set 'scss-compile-at-save' nil)
(autoload 'scss-mode' "scss-mode")
;(add-to-list 'auto-mode-alist '("\\.sass\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(setq css-indent-offset 2)

(require 'less-css-mode)

(provide 'lang-css)
