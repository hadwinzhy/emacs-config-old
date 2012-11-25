(provide 'lang-python)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Pymacs Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download:https://github.com/pinard/Pymacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Pymacs End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Python Mode Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download:https://github.com/pinard/Pymacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Python Mode End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'python-mode)
(setq py-load-pymacs-p t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PyComplete Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Download: 1) pycomplete.py: http://www.rwdev.eu/python/pycomplete/pycomplete.py
;;          2) pycomplete.el: http://www.rwdev.eu/python/pycomplete/pycomplete.el
;;Usage: put pycomplete.py to /usr/local/lib/python2.7/dist-packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PyComplete End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python-mode settings
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist(cons '("python" . python-mode)
                             interpreter-mode-alist))
;; path to the python interpreter, e.g.: ~rw/python27/bin/python2.7
(setq py-python-command "python")
(autoload 'python-mode "python-mode" "Python editing mode." t)

(setq pymacs-python-command py-python-command)

(require 'pycomplete)
