;;;;;;;;;;JSON
(require 'json-mode)
(add-hook 'json-mode-hook
          (lambda ()
            (setq js-indent-level 4)))

;;;;;;;;;;Docker
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;;;;;;;;;;;;;;;;;
(provide 'lang-others)
