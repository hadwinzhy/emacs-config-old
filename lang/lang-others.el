(require 'json-mode)
(add-hook 'json-mode-hook
          (lambda ()
            (setq js-indent-level 4)))
(provide 'lang-others)
