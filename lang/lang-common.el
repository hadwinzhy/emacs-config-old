(provide 'lang-common)

(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style
      '(face trailing tabs lines lines-tail empty
        space-after-tab space-before-tab))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
