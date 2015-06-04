;(add-to-list 'load-path "/3rd-party/magit")
;(eval-after-load 'info
;  '(progn (info-initialize)
;          (add-to-list 'Info-directory-list "/3rd-party/magit/")))
(require 'magit)
(global-set-key [f9] 'magit-status)
(provide 'lang-git)
