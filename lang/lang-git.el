(add-to-list 'load-path "/3rd-party/git-modes")
(add-to-list 'load-path "/3rd-party/magit")
(eval-after-load 'info
  '(progn (info-initialize)
          (add-to-list 'Info-directory-list "/3rd-party/magit/")))
(require 'magit)
(provide 'lang-git)
